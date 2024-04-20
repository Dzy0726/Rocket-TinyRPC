#pragma once
#include <queue>
#include <thread>
#include <mutex>
#include <condition_variable>

// 异步写日志的日志队列
template <typename T>
class LockQueue {
public:
    // 多个worker线程都会写日志queue
    void push(const T& data) {
        std::lock_guard<std::mutex> lock(m_mutex); // 获取互斥锁
        m_lockQueue.push(data);
        m_conVariable.notify_one();
    }

    // 一个线程读日志queue，写日志文件
    T pop() {
        std::unique_lock<std::mutex> lock(m_mutex);
        while (m_lockQueue.empty()) {
            // 日志队列为空，线程进入wait状态
            m_conVariable.wait(lock);
        }

        T data = m_lockQueue.front();
        m_lockQueue.pop();
        return data;
    }

private:
    std::queue<T> m_lockQueue;
    std::mutex m_mutex;
    std::condition_variable m_conVariable;
};