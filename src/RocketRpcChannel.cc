#include "RocketRpcChannel.h"

/**
 * header_size + service_name method_name args_size + args
*/

void RocketRpcChannel::CallMethod(const google::protobuf::MethodDescriptor* method,
                                    google::protobuf::RpcController* controller, 
                                    const google::protobuf::Message* request,
                                    google::protobuf::Message* response, 
                                    google::protobuf::Closure* done) {
    const google::protobuf::ServiceDescriptor * sd = method -> service();                               
    std::string service_name = sd -> name(); // service_name
    std::string method_name = method -> name(); // method_name

    // 获取参数的序列化字符串长度 args_size
    int args_size = 0;
    std::string args_str;
    if (request->SerializeToString(&args_str)) {
        args_size = args_str.size();
    } else {
        std::cout << "Serialize request error!" << std::endl;
        return;
    }

    // 定义rpc请求header
    Rocket::RpcHeader rpcHeader;
    rpcHeader.set_service_name(service_name);
    rpcHeader.set_method_name(method_name);
    rpcHeader.set_args_size(args_size);

    uint32_t header_size = 0;
    std::string rpc_header_str;
    if (rpcHeader.SerializeToString(&rpc_header_str)) {
        header_size = rpc_header_str.size();
    } else {
        std::cout << "Serialize rpcHeader error!" << std::endl;
        return;
    }

    // 组织待发送的rpc请求字符串
    std::string send_rpc_str;
    send_rpc_str.insert(0, std::string((char*)&header_size, 4)); // 从send_rpc_str的0开始写，写4个字节，写了一个整数
    send_rpc_str += rpc_header_str;
    send_rpc_str += args_str;

    // 打印调试信息
    std::cout << "===============================================" << std::endl;
    std::cout << "header_size: " << header_size << std::endl;
    std::cout << "rpc_header_str: " << rpc_header_str << std::endl;
    std::cout << "service_name: " << service_name << std::endl;
    std::cout << "method_name: " << method_name << std::endl;
    std::cout << "args_str: " << args_str << std::endl;
    std::cout << "===============================================" << std::endl;
    
    // 使用tcp编程，完成rpc方法的远程调用
    int clientFd = socket(AF_INET, SOCK_STREAM, 0);
    if (clientFd == -1) {
        std::cout << "create socket error! errno:" << errno << std::endl;
        exit(EXIT_FAILURE);
    }

    // 读取配置文件rpcserver的信息
    std::string ip = RocketApplication::GetInstance().GetConfig().Load("rpcserverip");
    uint16_t port = atoi(RocketApplication::GetInstance().GetConfig().Load("rpcserverport").c_str());

    struct sockaddr_in server_addr;
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(port);
    server_addr.sin_addr.s_addr = inet_addr(ip.c_str());

    // 连接rpc服务节点 点对点直连 
    // TODO： zookeeper服务中心发现一下节点
    if (-1 == connect(clientFd, (struct sockaddr*)&server_addr, sizeof(server_addr))) {
        std::cout << "connect error! errno: " << errno << std::endl;
        close(clientFd);
        exit(EXIT_FAILURE);
    }

    // 发送rpc请求
    if (-1 == send(clientFd, send_rpc_str.c_str(), send_rpc_str.size(), 0)) {
        std::cout << "send error! errno: " << errno << std::endl;
        close(clientFd);
        return;
    }

    // 接收rpc请求的响应值
    char recv_buf[1024] = {0};
    int recv_size = 0;
    if (-1 == (recv_size = recv(clientFd, recv_buf, 1024, 0))) {
        std::cout << "recv error! errno: " << errno << std::endl;
        close(clientFd);
        return;
    }

    // std::string response_str(recv_buf, 0, recv_size); // 出现bug
    
    // 数据反序列化rpc调用的响应数据
    if (!response->ParseFromArray(recv_buf, recv_size)) {
        std::cout << "Parse error! response_str: " << recv_buf << std::endl;
        close(clientFd);
        return;
    }

    close(clientFd);
}