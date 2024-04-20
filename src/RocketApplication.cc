#include "RocketApplication.h"
#include "iostream"
#include <unistd.h>
#include <string>


RocketConfig RocketApplication:: m_config;

void ShowArgsHelp() {
    std::cout << "Format: command -i <configfile>" << std::endl;
}

void RocketApplication::Init(int argc, char **argv) {
    // 传入参数小于2，说明没有正确启动
    if (argc < 2) {
        ShowArgsHelp();
        exit(EXIT_FAILURE);
    }

    int c = 0;
    std::string configFile; // 配置文件
    while ((c = getopt(argc, argv, "i:")) != -1) {
        switch (c) {
        case 'i':
            configFile = optarg;
            break;
        case '?':
            ShowArgsHelp();
            exit(EXIT_FAILURE);
        case ':':
            ShowArgsHelp();
            exit(EXIT_FAILURE);
        default:
            break;
        }
    }

    // 开始加载配置文件 rpcserverIP rpcserverPORT  zookeeperIP zookeeperPORT
    m_config.LoadConfigFile(configFile.c_str());

    // std::cout << "rpcserverip: " << m_config.Load("rpcserverip") << std::endl;
    // std::cout << "rpcserverport: " << m_config.Load("rpcserverport") << std::endl;
    // std::cout << "zookeeperip: " << m_config.Load("zookeeperip") << std::endl;
    // std::cout << "zookeeperport: " << m_config.Load("zookeeperport") << std::endl;
    LOG_INFO("====== INFO ABOUT RPC METHODS(Application)========");
    LOG_INFO("RPC SERVER IP: %s", m_config.Load("rpcserverip").c_str());
    LOG_INFO("RPC SERVER PROT: %s", m_config.Load("rpcserverport").c_str());
    LOG_INFO("ZOOKEEPER IP: %s", m_config.Load("zookeeperip").c_str());
    LOG_INFO("ZOOKEEPER PORT: %s", m_config.Load("zookeeperport").c_str());
    LOG_INFO("=================================================");

}

RocketApplication& RocketApplication::GetInstance() {
    static RocketApplication app;
    return app;
}

RocketConfig& RocketApplication::GetConfig() {
    return m_config;
}
