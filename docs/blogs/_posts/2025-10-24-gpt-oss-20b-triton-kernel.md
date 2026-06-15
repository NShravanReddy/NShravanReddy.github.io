---
layout: post
title: "Fine-Tuning GPT-OSS 20B to Generate Triton GPU Kernels"
date: 2025-10-24
tags: [LLM, Triton, GPU, Kernel]
---

*October 24, 2025*

I fine-tuned the **GPT-OSS 20B** model on the **KernelBook** dataset. The dataset contains detailed examples of **Triton** and **PyTorch** kernels, which I transformed into a format suitable for GPT-style supervised fine-tuning. Training took around **4 hours and 55 minutes**.

## What it does

The model can generate optimized Triton GPU kernels for various deep-learning operations and kernel templates.

## How it was built

- **Base model:** `openai/gpt-oss-20b`
- **Dataset:** `KernelBook-messages` (a filtered/modified version of KernelBook) reformatted into a GPT-style dialogue/sequence structure suitable for SFT.
- **Training:** Supervised fine-tuning (SFT) using TRL + Hugging Face Transformers, with PEFT/LoRA.
- **Training time:** ~**4 hrs 55 min** on 1x GPU.

### SFT Configuration

```python
from trl import SFTConfig

training_args = SFTConfig(
    learning_rate=2e-4,
    gradient_checkpointing=True,
    num_train_epochs=1,
    logging_steps=1,
    per_device_train_batch_size=4,
    gradient_accumulation_steps=4,
    max_length=2048,
    warmup_ratio=0.03,
    lr_scheduler_type="cosine_with_min_lr",
    lr_scheduler_kwargs={"min_lr_rate": 0.1},
    output_dir="checkpoints/demo/sft",
    report_to="wandb",
    run_name="gpt-oss-20b-sft",
    push_to_hub=True,
    hub_model_id="Nadiveedishravanreddy/gpt-oss-20b-triton-kernel",
    dataset_text_field='messages',
    save_strategy="steps",
    save_steps=100,
    save_total_limit=2,
    logging_strategy="steps",
    logging_dir="checkpoints/demo/logs",
)
```

```python
from trl import SFTTrainer

trainer = SFTTrainer(
    model=peft_model,
    args=training_args,
    train_dataset=ds['train'],
    processing_class=tokenizer,
)
trainer.train()
```

## Challenges

- Could not fine-tune the 120B model due to OOM (memory) limitations.
- Needed careful dataset reformatting so the model learns the input/output patterns for kernel generation.
- OOM issues with Llama 3.2 1B as well initially — resolved by reducing batch size and sequence length.

## Accomplishments

- Successfully fine-tuned the 20B model and published it on Hugging Face: [`Nadiveedishravanreddy/gpt-oss-20b-triton-kernel`](https://huggingface.co/Nadiveedishravanreddy/gpt-oss-20b-triton-kernel)
- Able to perform inference with the fine-tuned model and produce Triton kernel outputs.

## Project Timeline

### Phase 1: Research & Planning (Aug 2, 2025)

Surveyed prior work:
1. **Sakana's AI CUDA Engineer** — Purely evolutionary + agentic approach
2. **KernelLLM-8B** (Meta + Stanford) — Trained on 18k Triton samples for PyTorch-to-Triton translation
3. **Cognition's Kevin** — Trained QwQ-32B on KernelBench
4. **Anne Ouyang's Fast Kernels** — Agentic search-based approach
5. **AMD GEAK-agent** — LLM agent for GPU kernels

**Key takeaway:** These are all early works — not yet practical for Cursor-like environments, often produce incorrect code.

### Phase 2: Model Experiments (Aug 3–14)

- Tested **Qwen3-4B** on Colab with KernelLLM-style prompts
- Tested **Cerebras API** with one-shot prompts for Triton kernels
- Deployed in Streamlit

### Phase 3: Fine-tuning (Aug 11–Sep 6)

- Started with `facebook/KernelLLM`, then `openai/gpt-oss-20b`
- Dataset: `GPUMODE/KernelBook` → reformatted to GPT-style messages
- Tried Llama 3.2 1B fine-tuning (OOM issues initially)
- August 14: Fine-tuned llama-3.2-1b → [`Nadiveedishravanreddy/llama-3.2-1b-instruct-finetuned`](https://huggingface.co/Nadiveedishravanreddy/llama-3.2-1b-instruct-finetuned)
- Researched layer selection (why layers 7, 15, 23 only for fine-tuning?)
- September: Fine-tuned GPT-OSS 20B successfully

### Phase 4: Infrastructure (Sep 6–17)

- Used AMD ROCm with Docker: `rocm/pytorch-training:v25.6`
- Setup: `git clone https://github.com/AMD-AIG-AIMA/HF_PEFT_GPT_OSS.git`
- Modified training script for GPT-OSS 20B
- Trained with W&B logging

### GPU Setup

```bash
export PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True
python -m gpt_oss.generate --backend triton gpt-oss-20b/original/
```

## Model Card (summary)

- **Model:** `Nadiveedishravanreddy/gpt-oss-20b-triton-kernel` (fine-tuned from `openai/gpt-oss-20b`)
- **Purpose:** Generate Triton GPU kernels from high-level prompts / PyTorch snippets.
- **Dataset:** `KernelBook-messages` (modified KernelBook)
- **Training procedure:** SFT (Supervised Fine-Tuning) using TRL + Transformers
- **Framework versions:** TRL 0.22.2, Transformers 4.56.1, PyTorch 2.6.0, Datasets 4.0.0, Tokenizers 0.22.0

## Next steps

- [ ] Evaluate the generated kernels on KernelBench / benchmark scripts.
- [ ] Build an agent around the model to generate, validate, and optimize kernels automatically.
- [ ] Study how to create agents from models.
- [ ] Research proper prompt engineering for kernel generation.

## References & Links

- [facebook/KernelLLM](https://huggingface.co/facebook/KernelLLM)
- [GPUMODE/KernelBook dataset](https://huggingface.co/datasets/GPUMODE/KernelBook)
- [KernelBench](https://github.com/ScalingIntelligence/KernelBench.git)
- [Devpost Kernel LLM](https://devpost.com/software/kernel-llm)
- [Faster Transformers blog](https://huggingface.co/blog/faster-transformers)
- [W&B Training Logs](https://wandb.ai/nshravanreddy6-freelancer/huggingface/runs/14omaiyu/workspace)

---

[Notion](https://app.notion.com/p/nsr6/Create-an-llm-agent-to-write-triton-kernels-24205b97e27e80708b23e54cfb4b96fd)
