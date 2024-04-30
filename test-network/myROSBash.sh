cd ros2image

docker build -t ros2go .


if [[ $# -ge 1 ]]; then
    key = "$1"
    case $key in 
    -r )
        # docker rm ros2test1
        docker run -d --network=fabric_test --name ros2test ros2go
        ;;
    * )
        ;;
    esac
fi

docker exec -it ros2test bash

