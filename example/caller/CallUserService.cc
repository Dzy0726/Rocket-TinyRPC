#include <iostream>
#include "RocketApplication.h"
#include "user.pb.h"
#include "RocketRpcChannel.h"

/**
 * 业务代码:方法的消费者
 * 服务端发布的RPC服务，所以由服务端生成proto文件，约定rpc服务调用的方式和数据等
*/

int main(int argc, char** argv) {
    // 整个程序启动以后，想使用Rocket框架来享受rpc服务调用，一定需要先调用框架的初始化函数
    RocketApplication::Init(argc, argv);

    // 演示调用远程发布的rpc方法：Login
    fixbug::UserServiceRpc_Stub stub(new RocketRpcChannel());

    // rpc方法的请求参数
    fixbug::LoginRequest request;
    request.set_name("Dzy");
    request.set_pwd("Dzy123.0");

    // rpc方法的响应参数
    fixbug::LoginResponse response;


    // rpc方法的调用 同步的rpc调用过程
    // stub.Login(); 底层是调用了RpcChannel -> callMethod(); 集中来做所有rpc方法调用的参数序列化和网络发送
    // RpcChannel是抽象类，callMethod是纯虚函数，所以需要写一个类继承RpcChannel并重写callMethod函数，而这部分工作应该是框架来做（服务端）
    stub.Login(nullptr, &request, &response, nullptr);

    // 一次rpc调用完成，读调用的结果--response
    if (response.result().errorcode() == 0) {
        std::cout << "rpc login response success: " << response.success() << std::endl;
    } else {
        std::cout << "rpc login response error: " << response.result().errormsg() << std::endl;
    }

    return 0;
}