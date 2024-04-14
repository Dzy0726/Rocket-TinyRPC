#include <iostream>
#include <string>

#include "user.pb.h"

/*
    UserService原来是一个本地服务，提供了两个进程内的本地方法，Login和GetFriendLists
    这是业务代码
*/

class UserService : public fixbug::UserServiceRpc { //使用在rpc服务发布端（rpc服务的提供者）
public:
    bool Login(std::string name, std::string pwd) {
        std::cout << "Doing Local Service: Login" << std::endl;
        std::cout << "Name: " << name << " " << "Pwd: " << pwd << std::endl;
        return true;
    }
    /*
        重写基类UserServiceRpc的虚函数 下面这些方法都是框架直接调用
        1. caller ===> Login(LoginRequest) => muduo => callee
        2. callee ===> Login(LoginRequest) => 交到下面重写的这个Login方法上
    */

    void Login(::google::protobuf::RpcController* controller,
                       const ::fixbug::LoginRequest* request,
                       ::fixbug::LoginResponse* response,
                       ::google::protobuf::Closure* done) {
    
        // 框架给业务上报了请求参数LoginRequest 应用获取相应数据做本地业务
        std::string name = request -> name();
        std::string pwd = request -> pwd();
        
        // 做本地业务
        bool loginResult = Login(name, pwd);  

        // 把响应写入response 包括错误码 错误消息 返回值
        fixbug::ResultCode *rc = response->mutable_result();
        rc -> set_errorcode(0);
        rc -> set_errormsg("");
        response -> set_success(loginResult);

        // 执行回调操作 执行响应对象数据的序列化和网络发送（都是由框架来完成）
        done -> Run();
    }
};

int main() {
    // 调用框架的初始化操作 (配置)
    RocketApplication::Init(argc, argv);

    // 把UserService发布到rpc节点上
    // provider 是一个网络服务对象
    RpcProvider provider;
    provider.NotifyService(new UserService());
    provider.NotifyService(new ProductService());

    // 启动一个rpc服务发布节点 Run以后进程进入阻塞状态，等待远程rpc调用请求
    provider.Run();

    return 0;
}