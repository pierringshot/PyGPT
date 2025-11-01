#!/usr/bin/env bash
set -euo pipefail

PROJECT_NAME="PyGPT"
INSTALL_ROOT="/opt/pygpt"
VENV_DIR="${INSTALL_ROOT}/.venv"
BIN_LINK="/bin/pygpt"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PYTHON_BIN="${PYTHON_BIN:-python3}"

if [[ "${EUID}" -ne 0 ]]; then
  echo "[!] Bu skripti sudo ilə işlədin. | Please run this script with sudo." >&2
  exit 1
fi

echo "[1/6] ${PROJECT_NAME} faylları köçürülür... | Copying project files..."
rm -rf "${INSTALL_ROOT}"
mkdir -p "${INSTALL_ROOT}"
cp -r "${SCRIPT_DIR}/src" "${INSTALL_ROOT}/"
cp "${SCRIPT_DIR}/pyproject.toml" "${INSTALL_ROOT}/"
cp "${SCRIPT_DIR}/LICENSE" "${INSTALL_ROOT}/"
cp "${SCRIPT_DIR}/README.md" "${INSTALL_ROOT}/"

echo "[2/6] Virtual mühit yaradılır... | Creating virtual environment..."
${PYTHON_BIN} -m venv "${VENV_DIR}"
source "${VENV_DIR}/bin/activate"
trap 'deactivate >/dev/null 2>&1 || true' EXIT

echo "[3/6] Pip yenilənir... | Upgrading pip & setuptools..."
pip install --upgrade pip setuptools >/dev/null

echo "[4/6] PyGPT paket quraşdırılır... | Installing PyGPT package..."
pip install --no-cache-dir "${INSTALL_ROOT}" >/dev/null

echo "[5/6] Sistem inteqrasiyası... | Performing system integration..."
if [[ -L "${BIN_LINK}" || -e "${BIN_LINK}" ]]; then
  rm -f "${BIN_LINK}"
fi
ln -s "${VENV_DIR}/bin/pygpt" "${BIN_LINK}"

echo "[6/6] Əlavə yoxlamalar... | Running environment checks..."
if ! command -v chromium >/dev/null 2>&1 && \
   ! command -v chromium-browser >/dev/null 2>&1 && \
   ! command -v google-chrome >/dev/null 2>&1; then
  echo "⚠️  Chromium/Chrome tapılmadı. | Chromium-based browser not found."
  echo "   sudo apt install chromium-browser"
fi

if ! command -v Xvfb >/dev/null 2>&1; then
  echo "ℹ️  Başsız rejim üçün Xvfb quraşdırın. | Install Xvfb for headless mode."
  echo "   sudo apt install xvfb"
fi

cat <<'EON'
✅ PyGPT quraşdırıldı!
- PyGPT quraşdırma yolu /opt/pygpt
- Virtual mühit /opt/pygpt/.venv
- Komanda ilə başladıla bilər: pygpt

Demo:
  pygpt --token "SESSION_TOKEN"

EON
