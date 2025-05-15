docker build -t alpine-nginx ../task-2

mkdir -p ./docker-images
docker save alpine-nginx -o ./docker-images/image.tar

echo "Build suscess!"