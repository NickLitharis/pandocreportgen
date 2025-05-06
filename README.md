# 📄 Pandoc Report Generator 🚀

![Pandoc](https://img.shields.io/badge/Pandoc-1A1A1A?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTEyIDBDNS4zNzMgMCAwIDUuMzczIDAgMTJzNS4zNzMgMTIgMTIgMTIgMTItNS4zNzMgMTItMTJTMTguNjI3IDAgMTIgMHoiIGZpbGw9IiNmZmYiLz48L3N2Zz4=)
![LaTeX](https://img.shields.io/badge/LaTeX-008080?style=for-the-badge&logo=LaTeX&logoColor=white)

✨ **Automated PDF report generation from Markdown** using **Pandoc** and **XeLaTeX**. Perfect for academic reports, documentation, and technical writing! ✨

## 🛠️ Prerequisites

Before running the script, ensure you have:

1. Run `reqs.sh` to install:
   - [`Pandoc`](https://pandoc.org/) - Universal document converter 📑
   - [`XeLaTeX`](https://www.latex-project.org/get/) (TeX Live/MiKTeX) - Typesetting system 📜

2. Create these directories:
   - `📁 images/` - For all report images/assets
   - `📁 src/` - For your Markdown source files

3. **⚠️ Important**: Install required fonts for your document style

## 🚀 Quick Start

```bash
# 1. Make script executable
chmod +x make.sh

# 2. Add your Markdown files to src/
#    Add images to images/

# 3. Generate PDF report
./make.sh src
```
The generated PDF will appear in `build/` directory.

## 🖼️ Adding Images

Place images in `images/` and reference them in Markdown:
```markdown
![Image Description](../images/image.png)
```

## ⚙️ Configuration

Customize these variables in `make.sh`:

| Variable        | Purpose                          | Default Value       |
|-----------------|----------------------------------|---------------------|
| `BUILDDIR`      | Output directory for generated PDFs | `build/`            |
| `AUTHOR_FILE`   | Path to author metadata YAML file | `template/report.yaml` |

🔧 **Pro Tip**: Modify Pandoc options in the script for:

- Font styles/sizes

- Page margins

- Custom LaTeX templates

- Table of contents

💡 ***Tip**: Run pandoc `--list-extensions` to explore formatting options for your Markdown!*

## 🙏 Acknowledgments

- Pandoc team for the amazing document converter

- LaTeX community for beautiful typesetting

- Open source contributors everywhere 🌍

