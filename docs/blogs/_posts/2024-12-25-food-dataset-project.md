---
layout: post
title: "Food Dataset & Project Full Details"
date: 2024-12-25
last_modified_at: 2024-12-25
tags: [ML, Dataset, Fine-tuning, NLP]
---

*December 25, 2024*

A project exploring food datasets with LLM deployment and fine-tuning.

### Deploy LLM as API

1. **HF Spaces:** [microsoft-Phi-3.5-mini-instruct](https://huggingface.co/spaces/Nadiveedishravanreddy/microsoft-Phi-3.5-mini-instruct)
2. **Data Spreadsheet:** [Google Sheets](https://docs.google.com/spreadsheets/d/1EGr36IhODAirObchlfvaCufO-0GmJUZW6Eu_MxMcxxQ/edit?gid=0#gid=0)

### Project Setup

```bash
# Initialize with UV
uv init
uv venv satvick
source /bin/activate
uv venv
uv add --dev ipykernel
uv pip install ipykernel
uv run ipython kernel install --user --name=Satvick
uv add pydantic
```

### Git Setup

```bash
git init
git add .
git status
git remote add origin <Your-GitHub-Repository-URL>
git commit -m "commit message"
```

### `.gitignore` Template

```
# Build
/dist/
/build/

# Cache
.cache/
.coverage*
.mypy_cache/
.ruff_cache/
.pytest_cache/

# Editor
/.idea/
/.vscode/
.ipynb_checkpoints/

# Environs
.env
/.venv/

# Project
/docs/*
/mlruns/*
/outputs/*
!**/.gitkeep

# Python
*.py[cod]
__pycache__/
```

```bash
git push -u origin main
git remote add origin https://github.com/NShravanReddy/SatvickRecipe.git
git remote -v
git push --set-upstream origin master

# Remove .env from git history if committed
pip install git-filter-repo
git filter-repo --path .env --invert-paths --force
```

### Fine-tuning

- Fine-tuning using Unsloth with custom dataset
- [Word document with full ML model data preparation details](https://docs.google.com/document/d/1XSdupq99CLTt8g8LCSOCHaKMPHlIPxKC-NHIas7b7dM/edit?addon_store&tab=t.0)

*January 18, 2025*
- [Colab Notebook for input processing](https://colab.research.google.com/drive/1VYkncZMfGFkeCEgN2IzbZIKEDkyQuJAS?usp=sharing)

*December 1, 2025*
- [ChatGPT conversation](https://chatgpt.com/share/679a4dc8-8cac-8004-b94f-2cdae347edb4)

---

[Notion](https://app.notion.com/p/nsr6/Food-data-set-and-project-full-details-16705b97e27e800e8316cb9aad09dac3)
