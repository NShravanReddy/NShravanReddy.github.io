---
layout: default
title: Home
---

# Hi, I'm Shravan Reddy

Cloud Data Engineer building scalable ETL pipelines on GCP.  
I design,develop production-grade Airflow workflows, distributed data systems

---

## Data Engineering Projects

### 1. [**Streaming Data Processing Pipeline**](/blogs/2026/04/02/streaming_data_processing_pipeline/)
**Tech Stack:** Python, Apache Flink (PyFlink), Kafka (Redpanda), PostgreSQL, Docker

### 2. [**Cricket Statistics Data Pipeline**](/blogs/2026/02/16/cricket_analytics_pipeline/)
**Tech Stack:** Python, Apache Airflow, Google Cloud Storage, Dataflow, BigQuery, Cloud Functions, Pub/Sub


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

- [(Kimball's) Dimensional Modelling](https://nsr6.notion.site/36205b97e27e808db853dfaf8f9ec989?v=36a05b97e27e8007bf25000c39a9337a) - May 24, 2026
- [Pyspark](https://www.notion.so/nsr6/Pyspark-34905b97e27e80a7a976cd786db8bd3b) - May 5, 2026
- [Introduction to Batch Processing](https://www.notion.so/nsr6/Introduction-to-Batch-Processing-34905b97e27e80deb046d9d5bb2ada99) - May 1, 2026
- [GPT-OSS-20B-Triton-Kernel: Fine-Tuning a 20B Model to Generate GPU Kernels](/blogs/2025/10/24/gpt-oss-20b-triton-kernel/) - Oct 24, 2025
- [UV](https://www.notion.so/nsr6/UV-18905b97e27e8063926dec9973e3996f) - Jan 28, 2025
- [Installing PyTorch on ARM Mac (M1/M2/M3)](https://heymachinelearning.hashnode.dev/installing-pytorch-on-arm-macm1m2m3) - May 2, 2024
- [Introduction to Weight Quantization](/blogs/2024/02/24/introduction-to-weight-quantization/) - Feb 24, 2024
- [Installing TensorFlow on Mac M1](https://www.notion.so/nsr6/Installing-tensor-flow-on-Mac-m1-629604ff25274165b0d23c0cbdb064d0?source=copy_link) - Jan 10, 2024
- [AWS](https://nsr6.notion.site/AWS-a70b1f8b7ba344bab19ed7df3e9eff7f) - Jan 1, 2024
- [Downloading the LLM model from Hugging Face](/blogs/2024/01/01/downloading-llm-from-hf/) - Jan 1, 2024
- [Installing TensorFlow on ARM Mac (M1/M2/M3)](https://heymachinelearning.hashnode.dev/installing-tensor-flow-on-arm-macm1m2m3) - 2024
- [Neural Networks](https://heymachinelearning.hashnode.dev/neural-networks) - 2024
- [Functions of Machine Learning](https://heymachinelearning.hashnode.dev/functions-of-machine-learning) - 2024
- [Types of Machine Learning](https://heymachinelearning.hashnode.dev/types-of-machine-learning) - 2024
- [Tensorflow](https://www.notion.so/nsr6/Tensorflow-2bc1c8d79a65489aa77b2c842d1a0d1b?source=copy_link) - Dec 18, 2023 to Jan 12, 2024
- [Python on Hashnode](https://nsrai.hashnode.dev/python-1) - Jul 7, 2023
- [llama_3.2_1b_finetuning_rocm.ipynb](https://colab.research.google.com/drive/1kMcfDdielE1myo1arlFU7pqBPwU08I9B?usp=sharing)
