#pragma once

#include <string>
#include <unordered_map>

// 框架读取配置文件类
// rpcserverip rpcserverport zookeeperip zookeeperport
class RocketConfig {
public:
    //负责加载解析配置文件
    void LoadConfigFile(const char* configFile);
    // 查询配置项信息：传入key 返回对应的value
    std::string Load(const std::string &key);
private:
    std::unordered_map<std::string, std::string> m_configMap;
    // 去掉字符串前后的空格
    void Trim(std::string &src_buf);
};