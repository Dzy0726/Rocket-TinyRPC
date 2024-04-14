#include "RocketApplication.h"


void RocketApplication::Init(int argc, char **argv) {

}

RocketApplication& RocketApplication::GetInstance() {
    static RocketApplication app;
    return app;
}