# File Merger — Word, PDF, PPT, Images to one PDF

Merges Word, PowerPoint, PDF, Excel, and image files into a single PDF.
Text stays selectable, original formatting is preserved (via LibreOffice
conversion, not screenshots), and PowerPoint speaker notes are included
as their own text pages right after each slide.

Optionally appends a set of standard/default files (stored in
`default_files/`) at the end of every merge, selectable via checkboxes.

## Deployment (Render, free tier)

This app is deployed on [Render](https://render.com) using the included
`Dockerfile`, which installs LibreOffice and all Python dependencies.

1. Push this repo to GitHub
2. On Render: **New +** -> **Web Service** -> connect the GitHub repo
3. Environment: **Docker** (auto-detected from the Dockerfile)
4. Instance type: **Free**
5. Deploy - Render builds the Docker image and gives you a public URL
6. Every push to the connected branch auto-redeploys

## Local testing

```bash
pip install -r requirements.txt
# Also requires LibreOffice installed locally (soffice command)
python3 app.py
# Visit http://localhost:7860
```

## Notes on limits

- No file count / page count / word count limit is enforced by this app.
- A generous 500MB total upload size safety cap is set in `app.py`
  (`MAX_CONTENT_LENGTH`) - raise or remove it if needed.
- Render's free tier gives 512MB RAM / shared CPU - fine for normal
  document merging; very large or many simultaneous files may be slower.
- Render's free tier sleeps after ~15 minutes of inactivity and wakes
  up in under a minute on the next visit. No forced expiry, no billing
  required.

## Supported formats

DOCX, DOC, PPTX, PPT, PDF, XLSX, XLS, ODT, ODP, ODS, RTF, JPG, PNG, BMP,
TIFF, WEBP, GIF.

Folders and unsupported file types are rejected at upload time with a
clear message, both in the browser and on the server as a backstop.

## Default files feature

Files placed in `default_files/` appear as checkboxes on the upload
page under "Add standard files at the end". Any checked files are
appended, in the order listed, after all uploaded files in the final
merged PDF. `.gitkeep` and other dotfiles in that folder are hidden
from the checkbox list automatically.
