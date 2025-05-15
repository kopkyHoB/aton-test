docker run --name test-container -d $IMAGE_ID
echo "Результат запущенного контейнера в результате работы пайплайна:"
docker ps -a