# set(SRC_LIST CallUserService.cc ../user.pb.cc)

set(SRC_LIST CallFriendService.cc ../friend.pb.cc)
add_executable(consumer ${SRC_LIST})
target_link_libraries(consumer Rocket protobuf)