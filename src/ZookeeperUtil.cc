#include "ZooKeeperUtil.h"
#include "RocketApplication.h"
#include <semaphore.h>
#include <iostream>
#include "Logger.h"

// 全局的watcher观察器  zkserver给zkclient的通知
void global_watcher(zhandle_t *zh, int type,
                    int state, const char *path, void *wactherCtx) {
    
    if (type == ZOO_SESSION_EVENT) { // 回调的消息类型是和会话相关的消息类型 连接、断开连接、超时
        if (state == ZOO_CONNECTED_STATE) { // zkclient和zkserver连接成功
            sem_t *sem = (sem_t*)zoo_get_context(zh); // 从指定的句柄上拿到信号量
            sem_post(sem); // 给信号量资源加一
        }
    }
}


ZkClient::ZkClient() : m_zhandle(nullptr) {} //句柄是一个指针，初始化为空


ZkClient::~ZkClient() {
    if (m_zhandle != nullptr) {
        zookeeper_close(m_zhandle); // 关闭句柄，释放资源
    }
}


// 连接ZKServer
void ZkClient::Start() {
    std::string host = RocketApplication::GetInstance().GetConfig().Load("zookeeperip");
    std::string port = RocketApplication::GetInstance().GetConfig().Load("zookeeperport");
    std::string connstr = host + ":" + port;
    
    /**
     * zookeeper_mt：多线程版本
     * zookeeper的API客户端程序提供了三个线程
     * API调用线程
     * 网络IO线程 pthread_create 专门在这个线程里做网络连接 底层用了poll 毕竟是客户端程序 不需要高并发
     * watcher回调线程  pthread_create
    */
    m_zhandle = zookeeper_init(connstr.c_str(), global_watcher, 30000, nullptr, nullptr, 0); // 第二个参数是回调函数， 第三个会话超时时间
    if (nullptr == m_zhandle) {
        std::cout << "zookeeper_init error!" << std::endl; 
        LOG_ERROR("Zookeeper Init Error");
        exit(EXIT_FAILURE);
    }

    sem_t sem; // 信号量
    sem_init(&sem, 0, 0);
    zoo_set_context(m_zhandle, &sem); // 给监听器watcher传参数 给指定的句柄添加额外的信息

    /**
     * 初始化为0，主线程阻塞在这里
     * 因为zookeeper_init要求是异步建立连接，所以需要等全局watcher的回调函数 接收到ZOO_CONNECTED_STATE状态时，才能建立连接
     * zkserver会给zkclient发送通知，给绑定的信号量资源加一
     * 不再阻塞，连接成功
    */
    sem_wait(&sem); // 调用global回调后，如果会话连接成功， sem信号量会加一
    // std::cout << "zookeeper_init success!" << std::endl;
    LOG_INFO("Zookeeper Init Success");
}


void ZkClient::Create(const char* path, const char *data, int datalen, int state) {
    char path_buffer[128];
    int bufferlen = sizeof(path_buffer);
    int flag;
    // 先判断path表示的znode节点是否存在，如果存在，就不再重复创建了
    flag = zoo_exists(m_zhandle, path, 0, nullptr);
    if (ZNONODE == flag) {
        // 创建指定path的znode节点
        flag = zoo_create(m_zhandle, path, data, datalen, &ZOO_OPEN_ACL_UNSAFE, 0, path_buffer, bufferlen);
        if (flag == ZOK) {
            // std::cout << "znode create success... path: " << path << std::endl;
            LOG_INFO("ZNode Create Success... PATH: %s", path);
        } else {
            // std::cout << "flag: " << flag << std::endl;
            // std::cout << "znode create error... path: " << path << std::endl;
            LOG_ERROR("Flag: %d, ZNode Create Error... PATH: %s", flag, path);
            exit(EXIT_FAILURE);
        }
    }
}


// 根据指定的path，获取znode节点的值
std::string ZkClient::GetData(const char *path) {
    char buffer[64];
    int bufferlen = sizeof(buffer);
    int flag = zoo_get(m_zhandle, path, 0, buffer, &bufferlen, nullptr);
    if (flag != ZOK) {
        // std::cout << "get znode error... path: " << path << std::endl;
        LOG_ERROR("Get ZNode Error... PATH: %s", path);
        return "";
    } else {
        return buffer;
    }
}