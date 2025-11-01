# PyGPT 🔥

<div align="center">

![PyGPT Banner](https://img.shields.io/badge/PyGPT%20Bridge-Session--Token%20Gateway-blueviolet?style=for-the-badge&logo=python&logoColor=white)

[![Made by PierringShot Electronics™](https://img.shields.io/badge/Made%20by-PierringShot%20Electronics™-orange?style=flat-square)](https://github.com/pierringshot)
[![Python 3.9+](https://img.shields.io/badge/python-3.9%2B-3776ab?logo=python&logoColor=white)](https://www.python.org/)
[![License GPLv3](https://img.shields.io/badge/license-GPLv3-green.svg)](LICENSE)
[![Undetected ChromeDriver](https://img.shields.io/badge/undetected--chromedriver-3.5+-yellow?logo=googlechrome&logoColor=white)](https://github.com/ultrafunkamsterdam/undetected-chromedriver)

**PierringShot Electronics™ tərəfindən hazırlanmış qeyri-rəsmi ChatGPT sessiya-token körpüsü.**  
**An unofficial session-token bridge to the ChatGPT web interface, crafted by PierringShot Electronics™.**

</div>

---

## 🇦🇿 PyGPT nədir?
- **PyGPT**, rəsmi API istifadə etmədən, mövcud ChatGPT hesabınızı Chromium üzərindən idarə etməyə imkan verən sürətli körpüdür.
- Sessiya tokeni ilə giriş edir, söhbət axışını idarə edir və CLI vasitəsilə rahat istifadə təklif edir.
- Quraşdırma `setup.sh` skripti ilə tam avtomatikdir: faylları `/opt/pygpt` altına köçürür, virtual mühit yaradır və `pygpt` əmrini sisteminizə əlavə edir.

### Əsas Xüsusiyyətlər
- 🚀 **Tam avtomatik quraşdırma** – `sudo bash setup.sh`
- 🧠 **Sessiya-token login** – `__Secure-next-auth.session-token` ilə
- 🛡️ **Chromium + undetected-chromedriver** – Cloudflare qorumasından keçmək üçün
- 🌐 **Proxy dəstəyi** – `client.py` içində parametr olaraq verə bilərsiniz
- 🧰 **CLI** – `pygpt` əmrini işlədib dərhal dialoqa başlayın

---

## 🇦🇿 Sürətli Başlanğıc

```bash
git clone https://github.com/pierringshot/pygpt.git
cd pygpt/PyGPT
sudo bash setup.sh
```

### Sessiya Tokeni Necə Alınır?
1. `https://chat.openai.com/chat` səhifəsini açın.
2. Brauzer developer alətlərini (`F12`) açın.
3. `Application` → `Cookies` → `https://chat.openai.com` yolunda `__Secure-next-auth.session-token` cookie-ni tapın.
4. `Cookie Value` dəyərini kopyalayın.

### PyGPT CLI istifadəsi

```bash
pygpt --token "BURAYA_SESSIYA_TOKENI"
```

Əmr başladıqda:
- `reset` yazsanız dialoq sıfırlanar.
- `quit` / `exit` yazsanız proqramdan çıxar.

#### Əlavə Seçimlər
- `--conversation` – əvvəlki söhbətin ID-si ilə davam edin.
- `--verbose` – daha detallı loglar.

---

## 🇬🇧 What is PyGPT?
- **PyGPT** is a fast session-token bridge that lets you drive the ChatGPT web UI without the official API.
- It signs in with your `__Secure-next-auth.session-token`, maintains conversation state, and provides a friendly CLI.
- The `setup.sh` script copies everything into `/opt/pygpt`, spins up a dedicated virtualenv, and drops a system-wide `pygpt` command.

### Key Features
- 🚀 **One-command install** – `sudo bash setup.sh`
- 🧠 **Session-token authentication** – reuse your existing ChatGPT login
- 🛡️ **Chromium + undetected-chromedriver** – slips past Cloudflare bot checks
- 🌐 **Proxy support** – pass `proxy=` when instantiating the client
- 🧰 **CLI ready** – type `pygpt` and chat instantly

---

## 🇬🇧 Quick Start

```bash
git clone https://github.com/pierringshot/pygpt.git
cd pygpt/PyGPT
sudo bash setup.sh
```

### Grab Your Session Token
1. Visit `https://chat.openai.com/chat`.
2. Open developer tools (`F12`).
3. Navigate to `Application` → `Cookies` → `https://chat.openai.com`.
4. Copy the value of `__Secure-next-auth.session-token`.

### PyGPT CLI Usage

```bash
pygpt --token "PASTE_SESSION_TOKEN_HERE"
```

During the chat:
- Type `reset` to clear the current conversation.
- Type `quit` or `exit` to leave the session.

Optional flags:
- `--conversation` – continue a previous conversation ID.
- `--verbose` – print detailed logs.

---

## ⚙️ Tələblər | Requirements
- ✅ Linux (test edilmişdir Ubuntu/Debian üzərində) | Tested on Ubuntu/Debian
- ✅ Python 3.9 və ya yuxarı | Python 3.9+
- ✅ Chromium / Google Chrome (`chromium`, `chromium-browser` və ya `google-chrome`)
- ✅ Headless server üçün `xvfb` (opsional, tövsiyə olunur) | `xvfb` for headless boxes
- ✅ Stabil internet bağlantısı

---

## 🧠 Misal Kod | Example Code

```python
from pygpt import ChatGPT

api = ChatGPT(session_token="__Secure-next-auth.session-token")

response = api.send_message("Salam, PyGPT!")
print(response["message"])
```

- `client.py` daxilində `proxy`, `chrome_args`, `moderation` kimi parametrləri dəyişə bilərsiniz.
- `pygpt.__main__` modulu CLI ssenarisini təmin edir.

---

## 🧼 Quraşdırmanı Silmək | Uninstall

```bash
sudo rm -rf /opt/pygpt
sudo rm -f /bin/pygpt
```

---

## 📄 Lisenziya | License
- Layihə **GPL-3.0** lisenziyası ilə paylanır. (Bax: [LICENSE](LICENSE))
- This project is distributed under the **GPL-3.0** license. See [LICENSE](LICENSE).
- Original groundwork derived from the pyChatGPT project (GPL-3.0). Respect to all upstream contributors.

---

## 📬 Əlaqə | Contact
- **PierringShot Electronics™** – [@pierringshot](https://github.com/pierringshot)
- Sualınız varsa issue açın və ya PR göndərin. | Open an issue or send a PR if you have ideas.

> _“PyGPT – Sessiya tokeninin gücü ilə ChatGPT-yə yeni körpü.”_  
> _“PyGPT – A sleek bridge between you and ChatGPT’s web brain.”_
