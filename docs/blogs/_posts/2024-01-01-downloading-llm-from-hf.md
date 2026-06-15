---
layout: post
title: "Downloading the LLM model from Hugging Face"
date: 2024-01-01
tags: [LLM, HuggingFace, Setup]
---

1.Downloading normal to cache folder 

 Automatic (normal) download

from_pretrained() (or your trainer)

Downloads from Hugging Face Hub

Saves to cache (default ~/.cache/huggingface/hub/)

```python
from transformers import AutoModelForCausalLM, AutoTokenizer

model = AutoModelForCausalLM.from_pretrained(
    "meta-llama/Llama-3.2-1B-Instruct", 
    cache_dir="/jupyter-tutorial/hf_models"  # optional: control where it stores
)
tokenizer = AutoTokenizer.from_pretrained(
    "meta-llama/Llama-3.2-1B-Instruct", 
    cache_dir="/jupyter-tutorial/hf_models"
)
```

1. Downloading to specify folder

using the huggingface_hub.snapshot_download()

It downloads the whole repo

```python
from huggingface_hub import snapshot_download

# Download model files into your desired folder
snapshot_download(
    repo_id="meta-llama/Llama-3.2-1B-Instruct",
    local_dir="/jupyter-tutorial/hf_models/Llama-3.2-1B-Instruct"
)
```

[**Downloading the LLM model from hf – full notes**](https://www.notion.so/Downloading-the-llm-model-from-hf-24e05b97e27e8028a423deb02df17484?pvs=21)

