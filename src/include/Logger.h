#pragma once

#include <string>
#include "LockQueue.h"

enum LogLevel {
    INFO, // 普通信息
    ERROR, // 错误信息
};

// 日志系统
class Logger {
public:
    // 获取日志的单例
    static Logger& GetInstance();
    // 设置日志级别
    void SetLogLevel(LogLevel level);
    // 写日志
    void Log(std::string msg);
private:
    int m_logLevel;
    LockQueue<std::string> m_queue;
    Logger();
    Logger(const Logger&) = delete;
    Logger(Logger&&) = delete;
};


// 定义宏 LOG_INFO();
#define LOG_INFO(logmsgFormat, ...) \
    do \
    { \
        Logger &logger = Logger::GetInstance();\
        logger.SetLogLevel(INFO); \
        char c[1024] = {0}; \
        snprintf(c, 1024, logmsgFormat, ##__VA_ARGS__); \
        logger.Log(c); \
    } while(0); 

#define LOG_ERROR(logmsgFormat, ...) \
    do \
    { \
        Logger &logger = Logger::GetInstance();\
        logger.SetLogLevel(ERROR); \
        char c[1024] = {0}; \
        snprintf(c, 1024, logmsgFormat, ##__VA_ARGS__); \
        logger.Log(c); \
    } while(0); 