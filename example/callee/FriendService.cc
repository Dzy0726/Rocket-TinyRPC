#include <iostream>
#include <string>
#include <vector>
#include "friend.pb.h"
#include "RocketApplication.h"
#include "RocketRpcProvider.h"
#include "Logger.h"



class FriendService : public fixbug::FriendServiceRpc{
    std::vector<std::string> GetFriendsList(uint32_t id) {
        std::cout << "Doing Local Service: GetFriendsList, id: "  << id << std::endl;
        std::vector<std::string> friendsList;
        friendsList.push_back("FriendD");
        friendsList.push_back("FriendZ");
        friendsList.push_back("FriendY");
        return friendsList;
    }

    void GetFriendList(::google::protobuf::RpcController* controller,
                       const ::fixbug::GetFriendListRequest* request,
                       ::fixbug::GetFriendListResponse* response,
                       ::google::protobuf::Closure* done) {
        uint32_t id = request -> id();
        std::vector<std::string> friendsList = GetFriendsList(id);
        response -> mutable_result() -> set_errorcode(0);
        response -> mutable_result() -> set_errormsg("");
        for (std::string &name : friendsList) {
            std::string *p = response -> add_friends();
            *p = name;
        }
        done -> Run();
    }

};

int main(int argc, char** argv) {
    // // 测试日志模块
    // LOG_INFO("First log message!");
    // LOG_ERROR("%s:%s:%d", __FILE__, __FUNCTION__, __LINE__);

    // 调用框架的初始化操作 (配置)
    RocketApplication::Init(argc, argv);

    // 把FriendService发布到rpc节点上
    // provider 是一个网络服务对象 负责数据序列化反序列化 数据收发
    RocketRpcProvider provider;
    provider.NotifyService(new FriendService());

    // 启动一个rpc服务发布节点 Run以后进程进入阻塞状态，等待远程rpc调用请求
    provider.Run();

    return 0;
}