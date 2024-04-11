#include "test.pb.h"
#include <iostream>
#include <string>
using namespace fixbug;

// 简单情况
int test1() {
    // 封装了Login请求对象的数据
    LoginRequest req;
    req.set_name("Dong Zhenyu");
    req.set_pwd("dzy123.0");

    std::string send_str;
    /** 将消息序列化成二进制字符串，其中可能包含零字符\0 
     *  cout遇到\0以为结束，则不会打印后面的内容 
     **/ 
    if (req.SerializeToString(&send_str)) { 
        std::cout << send_str << std::endl;
    }

    // 从send_str反序列化一个login请求对象
    LoginRequest reqBack;
    if (reqBack.ParseFromString(send_str)) {
        std::cout << "Name: " << reqBack.name() << std::endl;
        std::cout << "Password: " << reqBack.pwd() << std::endl;
    }   
}

// message中有message怎么处理:     ResponseCode *result = response.mutable_result();
void test2() {
    LoginResponse response; // LoginResponse 包括一个message:ResponseCode 和一个 bool
    // response.set_allocated_result()  没有set_result
    // 要改errCode 和errMessage:
    ResponseCode *result = response.mutable_result();
    result -> set_errcode(1);
    result -> set_errmessage("登录失败!");
    response.set_success(false);
    
    //序列化
    std::string resultString;
    if (response.SerializeToString(&resultString)) {
        std::cout << resultString << std::endl;
    }

    //反序列化
    LoginResponse resBack;
    if (resBack.ParseFromString(resultString)) {
        std::cout << "success: " << resBack.success() << std::endl;
        ResponseCode *codeBack = resBack.mutable_result();
        std::cout << "errCode: " << codeBack -> errcode() << std::endl;
        std::cout << "errMessage: " << codeBack -> errmessage() << std::endl;
    }
}

int main() {
    GetFriendListsResponse flresp;
    ResponseCode *resultCode = flresp.mutable_result();
    resultCode -> set_errcode(1);
    resultCode -> set_errmessage("好友列表加载失败!");
    // 列表处理
    User *user1 = flresp.add_friend_list();
    user1 -> set_name("Dzy");
    user1 -> set_age(24);
    user1 -> set_sex(User::MAN);

    User *user2 = flresp.add_friend_list();
    user2 -> set_name("Dzy2");
    user2 -> set_age(19);
    user2 -> set_sex(User::WOMAN);

    // 序列化
    std::string friendRes;
    if (flresp.SerializeToString(&friendRes)) {
        std::cout << friendRes << std::endl;
    }

    std::cout << "反序列化: " << std::endl; 
    // 反序列化
    GetFriendListsResponse responseBack;
    if (responseBack.ParseFromString(friendRes)) {
        ResponseCode *rc = responseBack.mutable_result();
        std::cout << "errCode: " << rc -> errcode() << std::endl;
        std::cout << "errMessage: " << rc -> errmessage() << std::endl;
        User resUser1 = responseBack.friend_list(0);
        User resUser2 = responseBack.friend_list(1);
        std::cout << "response back User names:" << resUser1.name() <<"\t"<< resUser2.name() << std::endl;
        std::cout << "response back User ages:" << resUser1.age() <<"\t"<< resUser2.age() << std::endl;
        std::cout << "response back User sex:" << resUser1.sex() <<"\t"<< resUser2.sex() << std::endl;

    }
    std:: cout << "好友个数: " << flresp.friend_list_size() << std::endl;

    User getUser1 = flresp.friend_list(0);
    std:: cout << "User1 Name: " << getUser1.name() << std::endl;
    std:: cout << "User1 Age: " << getUser1.age() << std::endl;
    std:: cout << "User1 Sex: " << getUser1.sex() << std::endl;


    return 0;
}