---
layout: post
title: "GPT-OSS-20B-Triton-Kernel: Fine-Tuning a 20B Model to Generate GPU Kernels"
date: 2025-10-24
tags: [LLM, Triton, GPU, Kernel]
---

I have fine-tuned the **GPT-OSS 20B** model on the **KernelBook** dataset. This dataset contains detailed examples of **Triton** and **PyTorch** kernels, and I transformed it into the format suitable for GPT-style supervised fine-tuning. It took me around **4 hours and 55 minutes** to train this model.

I want to be explicit about the process and results:  
I have fine-tuned the GPT-OSS 20 billion model on the KernelBook dataset. This dataset contains the details about Triton kernels and PyTorch kernels. I transformed the dataset into the structure the GPT model expects, then used Hugging Face Transformers to fine-tune the model using an SFT/PEFT configuration. I will share the notebook so you can see the new dataset I created from the original KernelBook (released by Facebook). After fine-tuning, I was able to run inference on the fine-tuned model and published it on Hugging Face. It took about **4 hours 55 minutes** to train. I believe this fine-tune is very useful for generating Triton kernels using the GPT-OSS 20B model.

---

## What it does
The model can generate optimized Triton GPU kernels for various deep-learning operations and kernel templates.

## How it was built
- Base model: `openai/gpt-oss-20b`  
- Dataset: `KernelBook-messages` (a filtered/modified version of KernelBook) reformatted into a GPT-style dialogue/sequence structure suitable for SFT.  
- Training: supervised fine-tuning (SFT) using TRL + Hugging Face Transformers.  
- Training time: ~**4 hrs 55 min**.

## Challenges
- Could not fine-tune the 120B model due to OOM (memory) limitations.  
- Needed careful dataset reformatting so the model learns the input/output patterns for kernel generation.

## Accomplishments
- Successfully fine-tuned the 20B model and published it on Hugging Face: `Nadiveedishravanreddy/gpt-oss-20b-triton-kernel`.  
- Able to perform inference with the fine-tuned model and produce Triton kernel outputs.

## What we learned
- Dataset structure must match the model's expected prompt/response format for good SFT results.  
- Fine-tuning large models requires heavy memory planning (batch size, seq length, gradient checkpointing, etc.).

## Next steps
- Evaluate the generated kernels on KernelBench / benchmark scripts.  
- Build an agent around the model to generate, validate, and optimize kernels automatically.

---

## Timeline & Notes (selected)

- **Aug 02, 2025:** Concept & survey of prior work (Sakana, KernelLLM-8B, Cognition’s Kevin, Anne Ouyang’s Fast Kernels, AMD GEAK-agent).  
- **Aug 03–14, 2025:** Experiments with Qwen3-4B, Cerebras API, and agent prompts; Colab prototypes.  
- **Aug 11–Sep 17, 2025:** Trainer scripts, TRL SFT experiments, layer selection experiments, ROCm/HF_PEFT setup, Docker + MI300X attempts, W&B logging.  
- **Result:** Final model `Nadiveedishravanreddy/gpt-oss-20b-triton-kernel` with training visualized on Weights & Biases. Fine-tuning time ≈ 4:29:27 (reported in logs).

---

## Model Card (summary)

- **Model:** `Nadiveedishravanreddy/gpt-oss-20b-triton-kernel` (fine-tuned from `openai/gpt-oss-20b`)  
- **Purpose:** Generate Triton GPU kernels from high-level prompts / PyTorch snippets.  
- **Dataset:** `KernelBook-messages` (modified KernelBook)  
- **Training procedure:** SFT (Supervised Fine-Tuning) using TRL + Transformers  
- **Framework versions:** TRL 0.22.2, Transformers 4.56.1, PyTorch 2.6.0, Datasets 4.0.0, Tokenizers 0.22.0

---

## References & Links

- [facebook/KernelLLM](https://huggingface.co/facebook/KernelLLM)  
- [GPUMODE/KernelBook dataset](https://huggingface.co/datasets/GPUMODE/KernelBook)  
- Colab prototypes and agent code (internal links you shared during development)  
- [Devpost Kernel LLM](https://devpost.com/software/kernel-llm)  
- [Faster Transformers blog](https://huggingface.co/blog/faster-transformers)  
- [Benchmark script (faster-transformers-scripts)](https://huggingface.co/datasets/ariG23498/faster-transformers-scripts/blob/main/benchmark-kernels-with-without.py)
