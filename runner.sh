# cronで定期的に初期化する

#docker build -t fc2 .
docker stop $(docker ps -a | awk '/fc2:latest/ {print $1}')
docker rm -v $(docker ps -a | awk '/fc2:latest/ {print $1}')
docker run -d -p 80:80 fc2
