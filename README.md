# 🖼️ Image to A4 Organizer

> A Streamlit web app that arranges your images onto A4 pages and exports them as **PDF**, **HTML**, or **DOCX** — ready to print or share.

---

## ✨ Features

| | |
|---|---|
| 📤 **Multi-image upload** | JPG, PNG, WebP, BMP, TIFF |
| 📐 **A4 layout engine** | Automatic grid fitting with aspect-ratio preservation |
| 🗜️ **Compression control** | Low / Medium / High JPEG compression, on by default |
| 🔒 **Metadata stripping** | Removes EXIF, GPS, camera info on export, on by default |
| 📄 **3 export formats** | PDF, printable HTML, Word DOCX |
| 🔢 **Flexible grid** | 1, 2, 4, or any custom number of images per page |
| 🔄 **EXIF auto-rotation** | Fixes sideways phone photos automatically |
| 👁️ **Live preview** | Inline HTML layout preview before downloading |

---

## 🚀 Getting Started

### Prerequisites

- Python 3.9 or higher — download from [python.org](https://www.python.org/downloads/)

### macOS

**1. Install (one time only)**

Open Terminal, drag `installer.sh` into it and press Enter:

```bash
bash installer.sh
```

**2. Launch**

Double-click `run.command`. The browser opens automatically. Closing the Terminal window stops the app.

### Manual setup (any platform)

```bash
# Clone the repository
git clone https://github.com/your-username/image-organizer.git
cd image-organizer

# Create virtual environment and install dependencies
python3 -m venv .venv
source .venv/bin/activate        # macOS / Linux
# .venv\Scripts\activate         # Windows

pip install -r requirements.txt

# Run
streamlit run app.py
```

The app opens automatically at **http://localhost:8501**.

---

## 📦 Dependencies

| Package | Purpose |
|---|---|
| [Streamlit](https://streamlit.io) | Web UI framework |
| [Pillow](https://python-pillow.org) | Image loading, compression, EXIF rotation, metadata stripping |
| [ReportLab](https://www.reportlab.com) | PDF generation |
| [python-docx](https://python-docx.readthedocs.io) | Word DOCX generation |

---

## 🛠️ Usage Guide

### 1 — Upload images

Click **Browse files** or drag and drop images onto the upload area. Supported formats: `.jpg`, `.jpeg`, `.png`, `.webp`, `.bmp`, `.tiff`.

### 2 — Configure the layout (sidebar)

#### Compression

Enabled by default at **Medium**. Three quality levels are available:

| Level | JPEG Quality | Use when |
|---|---|---|
| **Low** | 82 | Printing — maximum detail |
| **Medium** | 55 | Balanced size vs. quality |
| **High** | 22 | Sharing digitally — smallest file |

#### Metadata

**Strip metadata** is enabled by default. Removes all EXIF data (GPS coordinates, camera model, timestamps, lens info) from images before they are written to any export file. EXIF orientation is applied first so photos stay correctly rotated, then the metadata is cleared.

#### Images per Page

| Option | Grid | Best for |
|---|---|---|
| **1** | 1 × 1 | Full-page single photo |
| **2** | 2 × 1 | Side-by-side comparison |
| **4** | 2 × 2 | Contact sheet, passport photos (default) |
| **Other** | Auto | Any custom number up to 50 |

For custom values the grid columns are calculated as `ceil(√n)` and rows as `ceil(n / cols)`.

#### Export Format

Select one or more formats before hitting **Generate**:

- **PDF** — print-ready, consistent across systems (default)
- **HTML** — open in any browser and use `Ctrl + P` to print; fully self-contained with embedded images
- **DOCX** — editable Word document with a borderless table grid

### 3 — Generate & download

Click **Generate**. The app processes all images and shows a download button for each selected format. An inline HTML preview is also available if HTML export was selected.

---

## 📄 Export Format Details

### PDF

- Page size: **A4** (210 × 297 mm)
- Margins: 10 mm on all sides
- Images are aspect-ratio fitted inside each grid cell
- Generated with ReportLab

### HTML

- Uses CSS `@page { size: A4; margin: 0; }` for accurate print sizing
- Images embedded as base64 — the file is fully self-contained
- To print: open in browser → `Ctrl + P` → set paper to A4, margins to None

### DOCX

- Page size: A4 with 10 mm margins
- Borderless table grid with exact row heights and column widths
- Each image is aspect-ratio fitted inside its cell
- Compatible with Microsoft Word, LibreOffice, and Google Docs

---

## 🗂️ Project Structure

```
image-organizer/
├── app.py            # Main Streamlit application
├── installer.sh      # One-time setup script (macOS)
├── run.command       # Double-click launcher (macOS)
├── requirements.txt  # Python dependencies
└── README.md
```

---

## 🔧 Configuration Reference

All settings live in the sidebar and are applied per-generation run. There is no persistent configuration file — everything is chosen fresh each session.

| Setting | Default | Options |
|---|---|---|
| Compression | ✅ On — Medium | Low / Medium / High |
| Strip metadata | ✅ On | — |
| Images per page | 4 | 1 / 2 / 4 / custom |
| Export PDF | ✅ On | — |
| Export HTML | ☐ Off | — |
| Export DOCX | ☐ Off | — |

---

## 🤝 Contributing

1. Fork the repo
2. Create a feature branch: `git checkout -b feature/my-feature`
3. Commit your changes: `git commit -m "Add my feature"`
4. Push to the branch: `git push origin feature/my-feature`
5. Open a Pull Request

---

## 📝 License

Distributed under the MIT License. See `LICENSE` for more information.
