# 📖 PDFium Build for Android (without V8)

This repository provides a fully automated workflow to **fetch, configure, and build PDFium for Android** (without V8 support) across all ABIs using **GitHub Actions**.  
No local setup or manual dependency management is required, everything is handled inside the CI/CD pipeline.

---

## 🚀 Features
- ✅ Automated build of **PDFium for Android** from the official source  
- ✅ Builds `pdfium.so` without V8 JavaScript engine support  
- ✅ Supports all Android ABIs (`armeabi-v7a`, `arm64-v8a`, `x86`, `x86_64`)  
- ✅ Minimal setup, everything runs in **GitHub Actions**  
- ✅ Preconfigured scripts for reproducible builds  
- ✅ Artifacts uploaded after each build for direct download  

---

## 🛠️ How It Works
1. The **workflow** (`.github/workflows/build.yml`) automatically:
   - Clones the official [PDFium](https://pdfium.googlesource.com/pdfium/) source  
   - Configures the Android build environment (NDK, SDK)  
   - Builds `pdfium.so` without V8 support for all Android ABIs  
   - Publishes build artifacts (libraries, headers) in the workflow summary

2. Builds are performed inside **GitHub-hosted runners**, so no local tools are needed

---

## ▶️ Usage

### 1. Fork or Clone this Repository
```bash
git clone https://github.com/your-username/your-repo.git
cd your-repo
```

### 2. Trigger the Build
- **Push to main branch** or **create a pull request** to trigger the build automatically
- **Manual trigger**: Go to **Actions** → **Build PDFium for Android** → **Run workflow**

### 3. Download Artifacts
After a successful build:
1. Go to the **Actions** tab
2. Click on the latest workflow run
3. Download the `android-pdfium` artifact containing:
   - `pdfium.so` for all Android ABIs
   - Required header files
   - Build configuration files

---

## 📁 Output Structure
The generated artifact contains:
```
android-pdfium/
├── args.gn                    # Build configuration
├── LICENSE                    # Main license file
├── PDFiumConfig.cmake         # CMake configuration
├── include/                   # PDFium header files
│   ├── cpp/
│   │   ├── fpdf_deleters.h
│   │   └── fpdf_scopers.h
│   ├── fpdfview.h
│   ├── fpdf_annot.h
│   ├── fpdf_attachment.h
│   ├── fpdf_catalog.h
│   ├── fpdf_dataavail.h
│   ├── fpdf_doc.h
│   ├── fpdf_edit.h
│   ├── fpdf_ext.h
│   ├── fpdf_flatten.h
│   ├── fpdf_formfill.h
│   ├── fpdf_fwlevent.h
│   ├── fpdf_javascript.h
│   ├── fpdf_ppo.h
│   ├── fpdf_progressive.h
│   ├── fpdf_save.h
│   ├── fpdf_searchex.h
│   ├── fpdf_signature.h
│   ├── fpdf_structtree.h
│   ├── fpdf_sysfontinfo.h
│   ├── fpdf_text.h
│   ├── fpdf_thumbnail.h
│   └── fpdf_transformpage.h
├── armeabi-v7a/
│   └── libpdfium.so          # Compiled shared library
├── arm64-v8a/
│   └── libpdfium.so          # Compiled shared library
├── x86/
│   └── libpdfium.so          # Compiled shared library
├── x86_64/
│   └── libpdfium.so          # Compiled shared library
└── licenses/                 # All third-party licenses
    ├── abseil.txt
    ├── agg23.txt
    ├── catapult.txt
    ├── cpu_features.txt
    ├── fast_float.txt
    ├── freetype.txt
    ├── icu.txt
    ├── lcms.txt
    ├── libjpeg_turbo.ijg
    ├── libjpeg_turbo.md
    ├── libopenjpeg.txt
    ├── libpng.txt
    ├── libtiff.txt
    ├── libunwind.txt
    ├── llvm-libc.txt
    ├── pdfium.txt
    └── zlib.txt
```

---

## 🔧 Integration with Android Projects

### Ready-to-Use Android Library
For a complete, ready-to-use Android PDFium wrapper, check out:  
**[AhmerPdfium - libPdfium](https://github.com/AhmerAfzal1/AhmerPdfium/tree/master/libPdfium)**  

This Android library is based on ModPdfium and provides:
- Easy-to-use Java/Kotlin API
- Pre-built AAR files
- Sample implementation
- Activity and Fragment helpers
- Complete documentation

---

## ⚙️ Build Configuration
- **PDFium Version**: Latest from official repository
- **V8 Support**: Disabled
- **Architectures**: All Android ABIs
- **Output**: Shared library (`libpdfium.so`)

---

## 🔧 Customization
Modify `.github/workflows/build.yml` to:
- Change PDFium source branch/commit
- Adjust build flags
- Modify target architectures
- Add additional patches or dependencies

---

## 📝 Notes
- Builds are performed without V8 for smaller binary size and reduced complexity
- The resulting `libpdfium.so` can be used directly in Android projects
- All dependencies are automatically managed within the workflow

---

## 🤝 Contributing
Contributions are welcome! Feel free to submit issues or pull requests to improve the build process.

---

## 📄 License
This project is licensed under the same terms as PDFium. Refer to the official PDFium repository for licensing details.