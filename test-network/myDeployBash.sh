#!/bin/bash
# 
# 关闭删除之前的节点和相关内容
. ./network.sh down

# 选择用什么crypto
if [[ $# -ge 1 ]]; then
    key = "$1"
    case $key in 
    -c )
        . ./network.sh up createChannel -ca -c mychannel
        shift
        ;;
    -f )
        . ./network.sh up createChannel -ca -c mychannel -s couchdb
        shift
        ;;
    * )
        ;;
    esac
else
    . ./network.sh up createChannel -ca -c mychannel
fi

# 部署peer和orderer节点
. ./network.sh up

# 部署链码
. ./network.sh deployCC -ccn test -ccp /workspaces/ros2-fabric-integration/chaincode_go/ -ccl go