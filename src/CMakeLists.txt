# aux_source_directory(. SRC_LIST)
set(SRC_LIST 
            RocketApplication.cc 
            RocketConfig.cc 
            RocketRpcProvider.cc 
            rpcheader.pb.cc 
            RocketRpcChannel.cc 
            RocketRpcController.cc
            Logger.cc
            ZookeeperUtil.cc)
add_library(Rocket ${SRC_LIST})
target_link_libraries(Rocket muduo_net muduo_base pthread /usr/local/lib/libzookeeper_mt.a)