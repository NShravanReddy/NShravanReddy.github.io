---
layout: post
title: "Creating an LLM Agent to Write Triton Kernels"
date: 2025-08-02
last_modified_at: 2026-06-16
tags: [LLM, Triton, GPU, Kernel, Fine-tuning]
---

# Create an llm agent to write triton kernels

Date: August 2, 2025
Status: Done

August 2, 2025 

| model |
| --- |
| [https://huggingface.co/facebook/KernelLLM](https://huggingface.co/facebook/KernelLLM) |

I got an idea to generate the triton kernels using the LLM Agents. I got to know from alex that they are exploring to create llm model that can generate GPU code

### Kernel-generating LLMs: What has been tried already?

| # | Model | Reference |
|---|---|---|
| 1 | **Sakana's AI CUDA Engineer**. This isn't trained on anything, it's a purely evolution + agentic approach. This is extremely useful, as it gives us somewhat of a lower bound of what our current base models are capable of. ◦ They mostly use closed-source models which is hard to compare to, but they also have some results with Deepseek-R1. | [Paper](https://pub.sakana.ai/static/paper.pdf) |
| 2 | **Us + Stanford + Meta's KernelLLM-8B**. We trained on 18k (mostly synthetically-generated) Triton code samples for translating **PyTorch code to Triton code**. Main result is improving Llama3's ability to produce "functionally correct" kernels with similar capabilities to Deepseek-R1. | [Tweet](https://x.com/marksaroufim/status/1904387185236980129) |
| 3 | **Cognition's Kevin**. They split KernelBench into a 4:1 train/test split, and train QwQ-32B using their own pre-defined reward for a trajectory of model outputs on a particular task. Their results are really hard to compare to because they train on a subset of KernelBench, but still they produce some interesting and fast kernels. | [Blog](https://cognition.ai/blog/kevin-32b) |
| 4 | **Anne Ouyang's Fast Kernels Blog**. Another cool work that is more agents in flavor and doesn't involve training, they show that they can produce some very fast kernels through search-based techniques. They evaluate only on NVIDIA L40S, but still help us estimate bounds for model capabilities. | [Blog](https://scalingintelligence.stanford.edu/blogs/fastkernels/) |
| 5 | AMD GEAK-agent. It is an LLM-based AI agent, which can write correct and efficient gpu kernels automatically. | [GitHub](https://github.com/AMD-AIG-AIMA/GEAK-agent/tree/main) |
| 6 | llama3.1 @august 14 to last week fine tuned llama 3.2 1b | [Google Colab](#google-colab) |
| 7 | gpt-oss-20b | [GPT-OSS-20B Triton Kernel](#gpt-oss-20b-triton-kernel) |

**Takeaways.** These papers are all cool, but they’re all very early works that in practice can’t really help out most GPU devs in say a Cursor-like environment. They also all tend to produce the same kinds of optimizations (mostly the obvious shared memory or fusion-type ops using a well-known algorithm) and many times they produce incorrect / non-functional code.

My Approach

## Google Colab

1. Used the Qwen3-4b and loaded to colab

https://colab.research.google.com/drive/1kMcfDdielE1myo1arlFU7pqBPwU08I9B#scrollTo=56Z0P0EKxgVN

Next steps

- [x]  check if able to call model throught agent
- [x]  Then give the prompt with the [kernel llm](https://huggingface.co/facebook/KernelLLM)  type and check the results , checked but prompt explanation is not there for the model

Agent code is present in this colab for gpt oss 120b

- [x]  Given simple prompt and able to get answers link [https://colab.research.google.com/drive/1MJeB2Y4OLO4rb2ifpDyL_R1ZpgD8sgu4?usp=sharing](https://colab.research.google.com/drive/1MJeB2Y4OLO4rb2ifpDyL_R1ZpgD8sgu4?usp=sharing)
- [ ]  Understanding how to give prompt to llm
- [ ]  check the amd GEAK agent prompt
- [ ]  Need to benchmark the results , which tool to use for bench marking

/root/.cache/huggingface/hub/models--Qwen--Qwen3-4B/snapshots

Answer_agent2.py

1 main class 

four functions

1. **init**
2. adapter
3. checkpoints
4. response for sample prompt

---

August 3, 2025 

modified the [model2.py](http://model2.py) file for cerebras api

Model 0:

model : cerebras api

Prompts: oneshot given and asked about the trion kernel 

deployed in stream lit 

---

August 4, 2025 

- [ ]  check how to create agents from models
- [x]  read scaling intelligence blog not able to understand

---

August 5, 2025 

- [ ]  check how  agents are created

Model 1:

model : facebook/KernelLLM

https://huggingface.co/facebook/KernelLLM

need to use agent based prompting

August 10, 2025 

## GPT-OSS-20B Triton Kernel

Model2:

model: openai/gpt-oss-20b

https://huggingface.co/openai/gpt-oss-20b

dataset: GPUMODE/KernelBook

[https://huggingface.co/datasets/GPUMODE/KernelBook](https://huggingface.co/datasets/GPUMODE/KernelBook)

Tried to do https://huggingface.co/docs/trl/en/sft_trainer#instruction-tuning-example instruction tuning but ran out of memory

- [ ]  how the model will be training on all the features it has given in the kernel book dataset using sft?

August 11, 2025 

creating the script for the trainer

August 12, 2025 

creating the script for the trainer

getting out of memory for llama3.2 1b

August 13, 2025 

[Downloading the llm model from hf](/blogs/llm-agent-triton-references/Downloading%20the%20llm%20model%20from%20hf%2024e05b97e27e8028a423deb02df17484.md)

@august 14 to last week fine tuned llama 3.2 1b

https://huggingface.co/Nadiveedishravanreddy/llama-3.2-1b-instruct-finetuned

Came to fine tune for competiton open ai

August 24, 2025 

![Screenshot 2025-08-24 at 3.41.09 PM.png](/blogs/images/Screenshot_2025-08-24_at_3.41.09_PM.png)

why 7,15,23 layers are only used for finetuning but in openai cook book said that e can exoeriment need to find research papers on them? 

how the model is finetuned just when we give dataset name in the 

```jsx
from trl import SFTTrainer

trainer = SFTTrainer(
    model=peft_model,
    args=training_args,
    train_dataset=ds['train'],
    processing_class=tokenizer,
)
trainer.train()
```

August 26, 2025 

***reduce the batch size and sequence length in the hyperparameters for less ram gpus***

**Fine tuning GPTOSS and hugging face Transformers**

August 30, 2025 

OOM Memory error to fine tune gpt oss 120b on one MI 300x

August 31, 2025 

searched ai agents framework confused

September 1, 2025 

can i connect two gpus and fine tune the gpt oss 120b

or

fine tune gpt oss 20b

[ 3/1136 00:09 < 3:00:34, 0.10 it/s, Epoch 0.00/1]

| **Step** | **Training Loss** |
| --- | --- |
| 1 | 0.000000 |

September 2, 2025 

```jsx
# On 1xH100
export PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True
python -m gpt_oss.generate --backend triton gpt-oss-120b/original/
export PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True
python -m gpt_oss.generate --backend triton gpt-oss-20b/original/
```

September 6, 2025 

[https://github.com/AMD-AIG-AIMA/HF_PEFT_GPT_OSS](https://github.com/AMD-AIG-AIMA/HF_PEFT_GPT_OSS)

Installing docker 

1. apt install docker.io
2. docker pull rocm/pytorch-training:v25.6
3. 

```
cd /workspace/

# Clone the repository
git clone https://github.com/AMD-AIG-AIMA/HF_PEFT_GPT_OSS.git
cd HF_PEFT_GPT_OSS

# For MI300X, upgrade required libraries
bash requirements_MI300.sh
```

vim run_peft_lora_openai.sh

removed --chat_template_format "chatml" \

/workspace/HF_PEFT_GPT_OSS/utils.py. → changed test data to train variable

errror with

[error_using_shell_cmd.txt](/blogs/llm-agent-triton-references/error_using_shell_cmd.txt)

need to check check point steps

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
    save_strategy="steps",    # save every N steps
    save_steps=100,           # adjust for your dataset size / patience
    save_total_limit=2,       # only keep last 2 checkpoints to save disk
    logging_strategy="steps", # keep logs consistent
    logging_dir="checkpoints/demo/logs",

)
```

Done

Nadiveedishravanreddy/gpt-oss-20b-triton-kernel

[https://wandb.ai/nshravanreddy6-freelancer/huggingface/runs/14omaiyu/workspace?nw=nwusernshravanreddy6](https://wandb.ai/nshravanreddy6-freelancer/huggingface/runs/14omaiyu/workspace?nw=nwusernshravanreddy6)

[finetuning_gpt_oss_20b_worked.ipynb](/blogs/llm-agent-triton-references/finetuning_gpt_oss_20b_worked.ipynb)

time took 4:29:27 < 26:03

- [ ]  need to evaluate the results
- [ ]  output is not coming properly so create an agent https://colab.research.google.com/drive/1MJeB2Y4OLO4rb2ifpDyL_R1ZpgD8sgu4?usp=sharing#scrollTo=0SJWdfmR8l4K

---

September 9, 2025 

September 10, 2025 

git clone [https://github.com/ScalingIntelligence/KernelBench.git](https://github.com/ScalingIntelligence/KernelBench.git)
cd KernelBench

conda create --name TK python=3.10
conda activate TK
pip install -r requirements.txt
pip install -e .

- [ ]  For gpt-oss-120b finetuning oom- [ ]  **ROCm enabled GPT-OSS able to create but not able to open it disconnected**

https://devpost.com/software/kernel-llm

September 17, 2025

Script to run gpt oss 120b with specified kernels

https://huggingface.co/blog/faster-transformers

https://huggingface.co/datasets/ariG23498/faster-transformers-scripts/blob/main/benchmark-kernels-with-without.py

--- 


[ Notion ](https://app.notion.com/p/nsr6/Create-an-llm-agent-to-write-triton-kernels-24205b97e27e80708b23e54cfb4b96fd?source=copy_link)
