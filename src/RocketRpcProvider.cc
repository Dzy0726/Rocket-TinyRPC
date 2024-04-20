#include "RocketRpcProvider.h"
#include "RocketApplication.h"
#include "rpcheader.pb.h"
#include "ZooKeeperUtil.h"


/*
    service_name => service 描述
                        => service* 记录服务对象
                        method_name => method 方法对象
json<键值对>         protobuf 基于二进制，紧密存储 占用带宽资源更少，存储效率更高
*/
// 框架提供给外部使用的，可以发布rpc方法的函数接口 需要接收任意的service
void RocketRpcProvider::NotifyService(google::protobuf::Service *service) {

    ServiceInfo service_info;
    // 获取了服务对象的描述信息
    const google::protobuf::ServiceDescriptor *pserviceDesc = service -> GetDescriptor();
    // 获取服务的名字
    std::string service_name = pserviceDesc -> name();
    // 获取服务对象service的方法的数量
    int methodCount = pserviceDesc -> method_count();
    // std::cout << "Service Name: " << service_name << std::endl;
    LOG_INFO("Service Name: %s", service_name.c_str());

    for (int i = 0; i < methodCount; ++i) {
        // 获取了服务对象指定下标的服务方法的描述（抽象描述）
        const google::protobuf::MethodDescriptor* pmethodDesc = pserviceDesc -> method(i);
        std::string method_name = pmethodDesc -> name();
        service_info.m_methodMap.insert({method_name, pmethodDesc});

        // std::cout << "Method " << i << " Name: " << method_name << std::endl;
        LOG_INFO("Method Name: %s", method_name.c_str());

    }
    service_info.m_service = service;
    m_serviceMap.insert({service_name, service_info});

    
}

// 启动rpc服务节点，开始提供rpc远程网络调用服务
void RocketRpcProvider::Run() {
    
    // 读取配置文件rpcserver的信息
    std::string ip = RocketApplication::GetInstance().GetConfig().Load("rpcserverip");
    uint16_t port = atoi(RocketApplication::GetInstance().GetConfig().Load("rpcserverport").c_str());
    muduo::net::InetAddress address(ip, port);
    
    // 创建TcpServer对象
    muduo::net::TcpServer server(&m_eventLoop, address, "RocketRpcProvider");
    // 绑定连接回调和消息读写回调方法  分离了网络代码和业务代码
    server.setConnectionCallback(std::bind(&RocketRpcProvider::OnConnection, this, std::placeholders::_1));
    server.setMessageCallback(std::bind(&RocketRpcProvider::OnMessage, this, std::placeholders::_1, std::placeholders::_2, std::placeholders::_3));

    // 设置muduo库的线程数量
    server.setThreadNum(4);

    // 把当前RPC节点上要发布的服务全部注册到zk上，让rpc client可以从zk上发现服务
    // session timeout 30s zkclient API 会有一个线程做网络连接，会以1/3timeout时间发送ping消息作为心跳消息
    ZkClient zkCli;
    zkCli.Start(); // 连接zkserver
    // service_name 为永久节点 method_name 为临时性节点
    for (auto &sp : m_serviceMap) {
        // 创建ZNode节点的路径 /service_name  ---- /UserServiceRpc
        std::string service_path = "/" + sp.first; // sp.first是service name
        zkCli.Create(service_path.c_str(), nullptr, 0, 0);
        for (auto &mp: sp.second.m_methodMap) {
            // 创建ZNode节点的路径 /service_name/method_name ---- /UserServiceRpc/Login
            std::string method_path = service_path + "/" + mp.first;
            // 存储当前这个rpc服务节点主机的ip和port
            char method_path_data[128] = {0};
            sprintf(method_path_data, "%s:%d", ip.c_str(), port);
            zkCli.Create(method_path.c_str(), method_path_data, sizeof(method_path_data), ZOO_EPHEMERAL); // ZOO_EPHEMERAL表示方法的ZNode是临时性节点
        }
    }

    // RPC服务端准备启动，打印信息
    // std::cout << "RPCProvider start service at ip: " << ip << " port: " << port << std::endl; 
    LOG_INFO("RPCProvider start service at ip: %s, port: %d", ip.c_str(), port);

    // 启动网络服务
    server.start();
    m_eventLoop.loop();
}

// 新的Socket连接回调
void RocketRpcProvider::OnConnection(const muduo::net::TcpConnectionPtr& conn) {
    if (!conn -> connected()) {
        // 和rpc client连接断开了
        conn -> shutdown();
    }
}

/**
 * 在框架内部，RpcProvider和RpcConsumer协商好二者之间通信用的protobuf数据类型
 * service_name method_name args 定义protobuf的message类型 进行数据头的序列化和反序列化
 *                               protobuf记录service_name, method_name和args_size也要记录 防止粘包问题
 * 传输的数据格式如下：
 * header_size(4字节) + header_str + args_str
 * 16UserServiceLoginZhangsan123456
*/
// 已建立连接的用户的读写事件的回调 如果远程有一个rpc服务的调用请求，那么OnMessage方法就会响应
void RocketRpcProvider::OnMessage(const muduo::net::TcpConnectionPtr& conn, 
                            muduo::net::Buffer* buffer, 
                            muduo::Timestamp) {
    // 网络上接收的远程rpc调用请求的字符流 包含了RPC方法的名字如 Login 参数 args
    std::string recv_buf = buffer -> retrieveAllAsString();

    // 从字符流中读取前四个字节的内容
    uint32_t header_size = 0;
    recv_buf.copy((char*)&header_size, 4, 0); //从0开始读取4各字节拷贝到headersize

    // 根据headersize读取数据头的原始字符流 反序列化数据 得到rpc请求的详细信息
    std::string rpc_header_str = recv_buf.substr(4, header_size);
    Rocket::RpcHeader rpcHeader;
    std::string service_name;
    std::string method_name;
    uint32_t args_size;
    if (rpcHeader.ParseFromString(rpc_header_str)) {
        // 数据头反序列化成功
        service_name = rpcHeader.service_name();
        method_name = rpcHeader.method_name();
        args_size = rpcHeader.args_size();
    } else {
        // std::cout << "rpc_header_str: " << rpc_header_str << " Paser Error!" << std::endl;
        LOG_ERROR("RPC Header String: %s Paser Error!", rpc_header_str.c_str());
        return;
    }
    
    // 获取rpc方法 参数的字符流数据
    std::string args_str = recv_buf.substr(4 + header_size, args_size);

    // 打印调试信息
    // std::cout << "===============================================" << std::endl;
    // std::cout << "header_size: " << header_size << std::endl;
    // std::cout << "rpc_header_str: " << rpc_header_str << std::endl;
    // std::cout << "service_name: " << service_name << std::endl;
    // std::cout << "method_name: " << method_name << std::endl;
    // std::cout << "args_str: " << args_str << std::endl;
    // std::cout << "===============================================" << std::endl;

    LOG_INFO("======= INFO ABOUT RPC METHODS(Provider)=========");
    LOG_INFO("Header Size: %d", header_size);
    LOG_INFO("RPC Header String: %s", rpc_header_str.c_str());
    LOG_INFO("Service Name: %s", service_name.c_str());
    LOG_INFO("Method Name: %s", method_name.c_str());
    LOG_INFO("Args String: %s", args_str.c_str());
    LOG_INFO("=================================================");


    // 获取service对象和method对象
    auto it = m_serviceMap.find(service_name);
    if (it == m_serviceMap.end()) {
        // 没找到对应的服务
        // std::cout << service_name << " is not exist!" << std::endl;
        LOG_ERROR("Service Name: %s is not exist!", service_name.c_str());
        return;
    }

    auto mit = it -> second.m_methodMap.find(method_name);
    if (mit == it -> second.m_methodMap.end()) {
        // 没找到对应的方法
        // std::cout << service_name << ":"  << method_name << " is not exist!" << std::endl;
        LOG_ERROR("Service Name: %s : %s is not exist!", service_name.c_str(), method_name.c_str());
        return;
    }


    google::protobuf::Service *service = it -> second.m_service;// 获取service对象  如UserService
    const google::protobuf::MethodDescriptor *method = mit -> second; // 获取method对象 如Login方法

    // 生成RPC方法调用的request和response参数
    google::protobuf::Message *request = service -> GetRequestPrototype(method).New();
    if (!request -> ParseFromString(args_str)) {
        // std::cout << "request parse error, content: " << args_str << std::endl;
        LOG_ERROR("Request parse error, content: %s ", args_str.c_str());
        return;
    }
    google::protobuf::Message *response = service -> GetResponsePrototype(method).New();

    // 给下面的Callmethod调用，绑定一个Closure的回调函数
    google::protobuf::Closure *done = google::protobuf::NewCallback<RocketRpcProvider, 
                                                                    const muduo::net::TcpConnectionPtr&, 
                                                                    google::protobuf::Message*>
                                                                    (this, &RocketRpcProvider::SendRpcResponse, conn, response);

    // 在框架上根据远端rpc请求，调用当前rpc节点上发布的方法
    // 相当于是new UserService().Login(controller, request, response, done)
    service -> CallMethod(method, nullptr, request, response, done);

    
}

void RocketRpcProvider::SendRpcResponse(const muduo::net::TcpConnectionPtr& conn, google::protobuf::Message* response) {
    std::string response_str;
    if (response -> SerializeToString(&response_str)) { // response序列化
        // 序列化成功后，通过网络把RPC方法执行的结果发送回rpc的调用方
        conn -> send(response_str);
    } else {
        // std::cout << "Serialize response_str error! " << std::endl;
        LOG_ERROR("Serialize response_str error!");
    }
    conn -> shutdown(); // 模拟HTTP短链接服务，由rpcprovider主动断开连接，为更多的rpc调用方提供服务
}
