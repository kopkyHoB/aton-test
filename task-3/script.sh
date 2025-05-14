var1=$(df -h | grep /dev/sda5 | awk '{print $5}' | tr -d '%')
if [ "$var1" -gt 85 ]; then
        echo -e "From: example@yandex.ru\nSubject:Alert\n\nПривет, у тебя забит диск >85%" | ssmtp example@yandex.ru
fi
