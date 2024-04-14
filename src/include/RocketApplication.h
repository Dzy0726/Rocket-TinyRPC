#pragma once

// 框架的基础类 单例模式 完成框架的初始化
class RocketApplication {
public:
    static void Init(int argc, char **argv);
    static RocketApplication& GetInstance();
private:
    RocketApplication(){}
    RocketApplication(const RocketApplication&) = delete;
    RocketApplication(RocketApplication&&) = delete; 
};