# 📖 PDFium Build with GitHub Actions

This repository provides a fully automated workflow to **fetch, configure, and build PDFium** for multiple platforms using **GitHub Actions**.  
No local setup or manual dependency management is required — everything is handled inside the CI/CD pipeline.

---

## 🚀 Features
- ✅ Automated build of **PDFium** from the official source.  
- ✅ Cross-platform support (Linux, Windows, macOS, Android).  
- ✅ Minimal setup — everything runs in **GitHub Actions**.  
- ✅ Preconfigured scripts for reproducible builds.  
- ✅ Artifacts uploaded after each build for direct download.  

---

## 🛠️ How It Works
1. The **workflow** (`.github/workflows/build.yml`) automatically:
   - Clones the official [PDFium](https://pdfium.googlesource.com/pdfium/) source.  
   - Applies patches (if provided).  
   - Runs the build scripts using the specified configuration.  
   - Publishes build artifacts (libraries, headers, etc.) in the workflow summary.

2. Builds are performed inside **GitHub-hosted runners**, so no local tools are needed.

---

## ▶️ Usage

### 1. Fork or Clone this Repository
```bash
git clone https://github.com/your-username/your-repo.git
cd your-repo
