docker load -i ./docker-images/image.tar

docker stop alpine-nginx
docker rm alpine-nginx

docker run -d -p --name alpine-nginx
