Чтение текстовых файлов по методу RSVP (быстрое чтение) — обёртка над speedread с dозможностью продолжить чтение.

Требования:
Ubuntu/Debian (bash, coreutils, grep — есть в системе)
git и curl — только если ставите из репозитория

Зависимости:
pip install speedread

Установка:
sudo apt update && sudo apt install -y python3-pip pipx git curl
pipx ensurepath && pipx install speedread
exec $SHELL


git clone https://github.com/DevilNotSaint/speedcat.git | mkdir -p ~/.local/bin && cp speedcat/speedcat ~/.local/bin/

Использование:
speedcat book.txt # спросит скорость, читает с началаspeedcat book.txt -r 3   # продолжить с точки 3

LICENSE — MIT.
