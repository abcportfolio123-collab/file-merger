---
title: File Merger
emoji: 📎
colorFrom: green
colorTo: gray
sdk: docker
app_port: 7860
---

# File Merger — Word, PDF, PPT, Images to one PDF

Merges Word, PowerPoint, PDF, Excel, and image files into a single PDF.
Text stays selectable, original formatting is preserved (via LibreOffice
conversion, not screenshots), and PowerPoint speaker notes are included
as their own text pages right after each slide.

## Deploy for free on Hugging Face Spaces (permanent, no time limit)

1. Go to https://huggingface.co/new-space
2. Name your Space (e.g. `file-merger`)
3. Choose **SDK: Docker**
4. Choose **Free** hardware tier (CPU basic)
5. Once created, upload all files from this folder to the Space
   (either via the web UI "Files" tab, or `git push` — HF Spaces are git repos)
6. Wait 2-3 minutes for the Docker build to finish
7. Your app is live at `https://huggingface.co/spaces/<your-username>/file-merger`
   (also embeddable/shareable directly)

### Deploying via GitHub (recommended so you keep source control too)

1. Create a new GitHub repo, push all files in this folder to it
2. On Hugging Face, create the Space as above, then in Space Settings →
   "Repository" link it to sync from your GitHub repo (or just copy files over
   — HF Spaces don't currently auto-mirror external GitHub repos on the free
   tier, so the simplest flow is: keep code on GitHub for backup/history, and
   copy/push the same files to the HF Space git remote to deploy)

```bash
# After creating the Space, HF gives you a git remote like:
git remote add space https://huggingface.co/spaces/<username>/file-merger
git push space main
```

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
  (`MAX_CONTENT_LENGTH`) — raise or remove it if needed.
- Free Hugging Face CPU Spaces have ~16GB RAM / 2 vCPU shared — fine for
  normal document merging; very large batches may be slower.
- The Space sleeps after ~48 hours with no visits and wakes up in under a
  minute on the next visit. No forced expiry, no billing required.

## Supported formats

DOCX, DOC, PPTX, PPT, PDF, XLSX, XLS, ODT, ODP, ODS, RTF, JPG, PNG, BMP,
TIFF, WEBP, GIF.
