#!/bin/sh
set -eu

cd "$(dirname "$0")/../.."
sportorg_python=${SPORTORG_PYTHON:-python3}

"$sportorg_python" -c 'import platform; assert platform.system() == "Darwin" and platform.machine() == "x86_64", "Use an x86_64 Python interpreter on macOS"'
if [ -d .git ]; then
    "$sportorg_python" .github/scripts/version.py
fi
"$sportorg_python" - <<'PY'
from pathlib import Path

import polib

for source in Path("sportorg/data/languages").rglob("*.po"):
    polib.pofile(str(source)).save_as_mofile(str(source.with_suffix(".mo")))
PY

export PYINSTALLER_CONFIG_DIR="$PWD/build/pyinstaller-cache"
"$sportorg_python" -m PyInstaller \
    --noconfirm --windowed --target-arch x86_64 \
    --name SportOrg --osx-bundle-identifier org.sportorg.macos \
    --icon "$PWD/sportorg/data/img/icon/sportorg.ico" \
    --hidden-import sportorg.data \
    --collect-data sportorg.data \
    --add-data "$PWD/LICENSE:." --add-data "$PWD/version:." \
    --specpath build --workpath build/pyinstaller \
    SportOrg.pyw
