# cronで定期的に初期化する

#docker build -t fc2 .
docker stop `docker ps -q`
docker rm -v $(docker ps -a -q)
docker run -d -p 80:80 fc2
