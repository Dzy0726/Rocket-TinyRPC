#include "RocketRpcController.h"

RocketRpcController::RocketRpcController() {
    m_failed = false;
    m_errText = "";
}

void RocketRpcController::Reset() {
    m_failed = false;
    m_errText = "";
}

bool RocketRpcController::Failed() const {
    return m_failed;
}

std::string RocketRpcController::ErrorText() const {
    return m_errText;
}

void RocketRpcController::SetFailed(const std::string& reason) {
    m_failed = true;
    m_errText = reason;
}

// 目前未实现
void RocketRpcController::StartCancel() {}
bool RocketRpcController::IsCanceled() const {return false;}
void RocketRpcController::NotifyOnCancel(google::protobuf::Closure* callback) {}

