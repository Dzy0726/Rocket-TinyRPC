# aux_source_directory(. SRC_LIST)
set(SRC_LIST RocketApplication.cc RocketConfig.cc RpcProvider.cc rpcheader.pb.cc RocketRpcChannel.cc RocketRpcController.cc)
add_library(Rocket ${SRC_LIST})
target_link_libraries(Rocket muduo_net muduo_base pthread)