---
layout: default
title: Home
---

# 👋 Hi, I'm Shravan Reddy

Cloud Data Engineer building scalable ETL pipelines on GCP.  
I design production-grade Airflow workflows, distributed data systems, and high-performance ML pipelines.

---

## 🏏 Data Engineering Projects

### 1. **Cricket Statistics Data Pipeline (GCP + Airflow + BigQuery)**

A cloud-native end-to-end ETL pipeline that extracts ODI cricket rankings from the Cricbuzz API, processes them using Google Cloud services, and loads structured data into BigQuery for analytics.

**Tech Stack:** Python, Apache Airflow, Google Cloud Storage, Dataflow, BigQuery, Cloud Functions, Pub/Sub

**Architecture Flow:**
- Extract → Cricbuzz API ingestion  
- Load → Raw storage in GCS  
- Transform → Dataflow with UDF processing  
- Load → Structured BigQuery analytics table  

**Engineering Highlights:**
- Automated API ingestion with Python  
- Orchestrated DAG scheduling using Airflow  
- Serverless event-driven architecture  
- Scalable transformation using Dataflow  
- BigQuery schema modeling  
- Monitoring & logging for reliability  

---


## Hackathon Projects

1.  **OpenAI Open Model Hackathon**
    Fine-tuned the gpt oss model with the expectation to generate kernels using the 120b model, but encountered an OOM error and switched to the 20b model. First, I experimented with fine-tuning a smaller model, using a 1b model from Meta, which I was able to fine-tune: [llama-3.2-1b-instruct-triton-kernel](https://huggingface.co/Nadiveedishravanreddy/llama-3.2-1b-instruct-triton-kernel).

    Finally, I was able to fine-tune by creating a custom dataset: [KernelBook-messages](https://huggingface.co/datasets/Nadiveedishravanreddy/KernelBook-messages). The peft fine-tuning took 4 hrs 55 min. I have uploaded the whole model and its weights in the hf: [gpt-oss-20b-triton-kernel](https://huggingface.co/Nadiveedishravanreddy/gpt-oss-20b-triton-kernel).

    [View Research Document](https://nsr6.notion.site/Create-an-llm-agent-to-write-triton-kernels-24205b97e27e80708b23e54cfb4b96fd?source=copy_link)

2.  **AMD AI Sprint Hackathon 2025 - 4th Place**
    Participated in the AMD AI Sprint Hackathon 2025 at the Indian Institute of Science (IISc), sponsored by Hugging Face and Meta. Our team secured 4th place by building a Question Agent and Answer Agent using Qwen3-4B for an IPL-style game.
    [Explore the Repository](https://github.com/NShravanReddy/AMD_AI_AGENTS)

3.  **LLM-Kernel-Agent (Cerebras Inference API Agent)**
    A vibe coded project that combines LLMs with kernel functions, leveraging the Cerebras Inference API with the model: llama-4-scout-17b-16e-instruct in Cerebras x Cline during the Vibe Coder Hackathon. This project builds upon the AMD Hackathon project, using the same template and incorporating improvements. The agent accepts high-level natural language prompts, generates optimized Triton GPU kernel code, uses Cerebras as the inference backend, provides a Streamlit UI with secure API key input, and handles UTF-8 content.
    [View Streamlit App](https://llm-kernel.streamlit.app)
    [Explore the Repository](https://github.com/NShravanReddy/LLM-Kernel-Agent/)
    [View Video](https://youtu.be/qYiEmmdFaK8)


4. **AMD GPU Kernel Optimization Challenge – My Experience**  
   In April 2025, I participated in AMD's FP8 GEMM Kernel Optimization Challenge. The task involved writing high-performance matrix multiplication kernels for MI300X GPUs using the Triton framework, targeting FP8 inputs (E4M3FNUZ) and BF16 outputs with per-group scaling.  
   [View Documentation](https://nshravanreddy.github.io/DeepLearning/)

## Blog Posts

- [GPT-OSS-20B-Triton-Kernel: Fine-Tuning a 20B Model to Generate GPU Kernels](/blogs/2025/10/24/gpt-oss-20b-triton-kernel/)
- [Introduction to Weight Quantization](/blogs/2024/02/24/introduction-to-weight-quantization/)
- [Downloading the LLM model from Hugging Face](/blogs/2024/01/01/downloading-llm-from-hf/)

## My Recent Projects


1. **Satvick Recipe Model – Llama 8B on Custom Dataset**  
   - [Notebook (GitHub)](https://github.com/NShravanReddy/SatvickRecipe/blob/master/satvick_recipe_model_gradio.ipynb)  
   - [Colab](https://colab.research.google.com/drive/1vhMHTafkyciJ3mzmLWUUuL5cVcDhkvi3?usp=sharing)

2. **Ollama + Unsloth + Llama-3 + CSV Finetuning**  
   - [Colab](https://colab.research.google.com/drive/1VYkncZMfGFkeCEgN2IzbZIKEDkyQuJAS?usp=sharing)

3. **llama_3.2_1b_finetuning_rocm.ipynb**  
   - [Colab](https://colab.research.google.com/drive/1kMcfDdielE1myo1arlFU7pqBPwU08I9B?usp=sharing)

4. **DeepLearning – End-to-End DL & LLM Engineering Repo**  
   A hands-on lab-style repository covering deep neural networks from scratch, optimization and regularization, transformers, ML system design, prompt engineering, LLM post-training, experiment tracking, and LLM tooling (Ollama, `llm` CLI, Perplexica, Inspect AI, NNI, etc.).  
   - [Explore the Repository](https://github.com/NShravanReddy/DeepLearning)

---

<footer>
  <div style="text-align: center; padding: 20px; border-top: 1px solid #eee; margin-top: 40px;">
    <p>&copy; 2025 Shravan Reddy</p>
    <div style="margin-top: 10px;">
      <a href="https://github.com/NShravanReddy" style="margin: 0 10px; text-decoration: none; color: #333; font-size: 24px;">Github</a>
      <a href="https://x.com/nshravanr" style="margin: 0 10px; text-decoration: none; color: #333; font-size: 24px;">X</a>
    </div>
  </div>
</footer>