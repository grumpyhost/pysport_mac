[![Python 3.8](https://img.shields.io/badge/python-v3.8-blue.svg?logo=pythonlang)](https://www.python.org/downloads/)
[![License: GPL v3](https://img.shields.io/badge/license-GPLv3-blue.svg)](https://github.com/sportorg/pysport/blob/develop/LICENSE)
[![Orienteering](https://img.shields.io/badge/sport-orienteering-blue.svg)](https://github.com/sportorg)
[![Sportorg version](https://img.shields.io/github/v/release/sportorg/pysport)](https://github.com/sportorg/pysport)
[![Orienteering](https://img.shields.io/github/stars/sportorg/pysport?style=social)](https://github.com/sportorg/pysport)

# SportOrg

Sportorg is a comprehensive software solution developed in Python that streamlines the organization and execution of orienteering competitions. Orienteering is a sport that challenges participants to navigate through unfamiliar terrain using only a map and compass, testing their navigation and decision-making skills. This software aims to enhance the experience for both event organizers and participants by providing a user-friendly platform to manage various aspects of orienteering competitions.

## Run from source

See [CONTRIBUTING.md](CONTRIBUTING.md)


Сборка SportOrg на macOS для Intel
Инструкция рассчитана на MacBook macOS Sequoia 15.5. На выходе получится SportOrg.app со встроенными Python и Qt. На компьютере, где будут запускать готовое приложение, отдельно устанавливать Python не нужно.
1. Подготовьте инструменты
Установите Python 3.12 для Intel или универсальную сборку Python 3.12. Если инструменты командной строки Xcode ещё не установлены, выполните в Терминале:
xcode-select --install
Проверьте версию и архитектуру Python:
python3.12 -c 'import platform; print(platform.python_version(), platform.machine())'
Ожидаемый результат — 3.12.x x86_64.
2. Распакуйте исходники
Скачайте исходники. Откройте в Терминале папку SportOrg-source, в которой лежат SportOrg.pyw и packaging/macos/build.sh. Удобный способ — набрать cd с пробелом, перетащить папку из Finder в окно Терминала и нажать Enter.
3. Соберите и запустите приложение
Из папки с исходниками выполните:
python3.12 -m venv .venv
.venv/bin/python -m pip install -r packaging/macos/requirements-build.txt
SPORTORG_PYTHON=.venv/bin/python sh packaging/macos/build.sh
При первой сборке pip скачает зависимости, включая Qt. Готовое приложение появится в dist/SportOrg.app. Чтобы проверить архитектуру и запустить его, выполните:
file dist/SportOrg.app/Contents/MacOS/SportOrg
open dist/SportOrg.app
Команда file должна показать Mach-O 64-bit executable x86_64. Для проверки создайте тестовое соревнование, сохраните его и снова откройте.
4. Упакуйте приложение для переноса
ditto -c -k --keepParent dist/SportOrg.app dist/SportOrg-macOS-Intel.zip
Пробная сборка использует локальную подпись PyInstaller и не проходит нотариализацию Apple. При переносе ZIP на другой Mac система может запросить подтверждение первого запуска. Инструкция Apple

Для SPORTident драйвер Silicon Labs CP210x VCP устанавливается отдельно на Mac, к которому подключён BSM8‑USB. Для самой сборки он не нужен. Чтение чипа через BSM8‑USB проверено  на MacBook. 