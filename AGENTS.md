# PyGPT Agent Playbook

This guide captures the essentials for anyone maintaining or extending the PyGPT project.

## 📌 Mission Snapshot
- **Project goal:** Provide a Chromium-powered, session-token bridge to ChatGPT with a turnkey CLI and installer.
- **Primary artifacts:** `setup.sh`, `pyproject.toml`, package sources under `src/pygpt/`, bilingual `README.md`.
- **Key stakeholders:** PierringShot Electronics™ (owner) and Azerbaijan Cybersecurity Center (partner).

## 🔧 Local Development
1. Create an isolated environment.
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate
   pip install --upgrade pip setuptools
   ```
2. Install the package in editable mode when working locally.
   ```bash
   pip install -e .
   ```
3. Linting/formatting is manual for now; follow existing style (PEP8, 2‑3 line spacing, bilingual messaging where user-facing).

## 🧪 Testing Checklist
- Run the CLI help to ensure the entry point resolves: `pygpt --help`.
- Smoke-test headless automation if Chrome/Chromium and Xvfb are present:
  ```bash
  pygpt --token "<session_token>" --verbose
  ```
- Keep an eye on `undetected_chromedriver` compatibility; add regression notes if Google updates Chrome.

## 🚀 Installer Flow (`setup.sh`)
- Requires `sudo`; installs into `/opt/pygpt`, creates a venv, symlinks `/bin/pygpt`.
- Verifies Chromium/Chrome and Xvfb availability.
- If you modify dependencies, ensure `setup.sh` mirrors those changes (especially `pip install` arguments).

## 📁 Repo Hygiene
- `.gitignore` already filters venvs, `__pycache__`, build outputs—extend it if tooling introduces new artifacts.
- Keep `README.md` bilingual (AZ + EN) with branding intact.
- Document new modules in `AGENTS.md` as they appear.

## 🔐 Security & Tokens
- Never store real `__Secure-next-auth.session-token` values in the repo or issue tracker.
- Redact logs before sharing. Mark troubleshooting notes with `[REDACTED]` where appropriate.

## 📦 Release Cadence
- Tag releases with `vX.Y.Z` and attach quick setup instructions.
- Consider publishing to PyPI once stability improves (update `pyproject.toml` metadata accordingly).
- When cutting a release, regenerate the README demo commands if behavior changed.

## 📝 Communication
- Git commits follow Conventional Commit style (`feat:`, `fix:`, `docs:`, etc.).
- Open PRs should mention installation/testing results and any Chromium compatibility notes.
- Keep partners looped in with README updates or repository topics when major changes land.

Stay sharp, automate safely, and keep the bridge humming. 🛠️🤖
