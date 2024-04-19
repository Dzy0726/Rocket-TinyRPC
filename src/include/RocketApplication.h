#pragma once

#include "RocketConfig.h"
#include "RocketRpcChannel.h"
#include "RocketRpcController.h"
// 框架的基础类 单例模式 完成框架的初始化
class RocketApplication {
public:
    static void Init(int argc, char **argv);
    static RocketApplication& GetInstance();
    static RocketConfig& GetConfig();

private:
    static RocketConfig m_config;
    RocketApplication(){}
    RocketApplication(const RocketApplication&) = delete;
    RocketApplication(RocketApplication&&) = delete; 
};