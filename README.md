Чтение текстовых файлов по методу RSVP (быстрое чтение) — обёртканад speedread с запоминаниемточки возобновления.

Установка
git clone https://github.com/ВАШ_ЛОГИН/speedcat.gitmkdir -p ~/.local/bin && cp speedcat/speedcat ~/.local/bin/
Требуется: pip install speedread

Использование
speedcat book.txt        # спросит скорость, читает с началаspeedcat book.txt -r 3   # продолжить с точки 3
LICENSE — возьмите текст MIT с choosealicense.com, впишите год и своё имя. Публичный проект без лицензии формально «all rights reserved» — другие не смогут легально использовать код.
