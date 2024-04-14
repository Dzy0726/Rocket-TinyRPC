#include <iostream>
#include <string>
#include "RocketConfig.h"


//负责加载解析配置文件
void RocketConfig::LoadConfigFile(const char* configFile) {
    FILE *pf = fopen(configFile, "r");
    if (pf == nullptr) {
        std::cout << configFile << " is not exist!" << std::endl;
        exit(EXIT_FAILURE);
    }

    // 1.注释 2.正确的配置项 =  3.去除开头多余空格
    while(!feof(pf)) {
        char buf[512] = {0};
        fgets(buf, 512, pf);

        // 去掉字符串前面多余的空格
        std::string read_buf(buf);
        Trim(read_buf);
        // 判断“#”注释
        if (read_buf[0] == '#' || read_buf.empty()) {
            continue;
        }
        
        // 解析配置项
        int idx = read_buf.find('=');
        if (idx == -1) {
            // 配置项不合法
            continue;
        }

        std::string key;
        std::string value;
        key = read_buf.substr(0, idx);
        Trim(key);
        // rpcserverip=127.0.0.1\n
        int end_idx = read_buf.find('\n', idx);
        value = read_buf.substr(idx + 1, end_idx - idx - 1);
        Trim(value);
        // std::cout << "Key: " << key << std::endl;
        // std::cout << "Value: " << value << std::endl;
        m_configMap.insert({key, value});
    }
}


// 查询配置项信息：传入key 返回对应的value
std::string RocketConfig::Load(const std::string &key) {
    auto it = m_configMap.find(key);
    if (it == m_configMap.end()) {
        return "NOT FOUND";
    }
    return it -> second;
}

// 去掉字符串前后的空格
void RocketConfig::Trim(std::string &src_buf) {
    int idx = src_buf.find_first_not_of(' ');
    if (idx != -1) {
        // 说明字符串前面有空格
        src_buf = src_buf.substr(idx, src_buf.size() - idx);
    }

    // 去掉字符串后面多余的空格
    idx = src_buf.find_last_not_of(' ');
    if (idx != -1) {
        // 说明字符串后面有空格
        src_buf = src_buf.substr(0, idx + 1);
    }

}