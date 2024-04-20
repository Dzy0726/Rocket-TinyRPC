#include "Logger.h"
#include <thread>
#include <time.h>
#include <iostream>

// 获取日志的单例
Logger& Logger::GetInstance() {
    static Logger logger;
    return logger;
}


Logger::Logger() {
    // 启动写日志线程
    std::thread writeLogTask([&]() {
        for (;;) {
            // 获取当天的日期，然后取日志信息，写入相应的文件当中 a+（文件不存在要创建，存在的话追加）
            time_t now = time(nullptr);
            tm *nowTM = localtime(&now);

            char fileName[128];
            sprintf(fileName, "%d-%d-%d-log.txt", nowTM -> tm_year + 1900, nowTM -> tm_mon + 1, nowTM -> tm_mday);
            FILE *pf = fopen(fileName, "a+");
            if (pf == nullptr) {
                std::cout << "logger file : " << fileName << " open error!" << std::endl;
                exit(EXIT_FAILURE);
            }
            std::string msg = m_queue.pop();

            char time_buf[128] = {0};
            sprintf(time_buf, "%d:%d:%d => [%s] ", 
                    nowTM -> tm_hour, 
                    nowTM -> tm_min, 
                    nowTM -> tm_sec,
                    (m_logLevel == INFO ? "INFO" : "ERROR"));
            msg.insert(0, time_buf);
            msg.append("\n");

            fputs(msg.c_str(), pf);
            fclose(pf);
        }
    });
    // 设置分离线程，守护线程
    writeLogTask.detach();

}


// 设置日志级别
void Logger::SetLogLevel(LogLevel level) {
    m_logLevel = level;
}


// 写日志 把日志信息写入lockqueue缓冲区中
void Logger::Log(std::string msg) {
    m_queue.push(msg);
}