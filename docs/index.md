---
layout: default
title: Home
description: Cloud Data Engineer building production ETL/ELT pipelines on GCP with Airflow, BigQuery, Dataflow, and Pub/Sub. GCP Professional Data Engineer certified. Portfolio featuring data engineering projects, certifications, and technical blog posts.
---

# Hi, I'm Shravan Reddy — Cloud Data Engineer

Building production data platforms on GCP with **2.5+ years** of experience designing and orchestrating ETL/ELT pipelines at scale.  
Google Cloud **Professional Data Engineer** certified.

**Core expertise:** Apache Airflow · BigQuery · Cloud Composer · Dataflow · Pub/Sub · Python · SQL

---

## Experience Highlights

- **2.5+ years** building data platforms and pipelines on Google Cloud Platform
- Production **ETL/ELT pipelines** using Python, SQL, Apache Airflow, and BigQuery
- Experience with **streaming systems** (Kafka/Redpanda, Dataflow) and **warehouse optimization**
- **Google Cloud Professional Data Engineer** certified

---

## Skills

**Languages:** Python, SQL  
**Cloud:** GCP (BigQuery, Dataflow, Cloud Composer / Airflow, Pub/Sub, Cloud Storage)  
**Orchestration:** Apache Airflow  
**Streaming:** Kafka / Redpanda, Apache Flink  
**ML / AI:** PyTorch, Triton, LLM fine-tuning, Hugging Face

---

## Certifications

- 🏅 [Google Cloud Professional Data Engineer](https://www.credly.com/badges/e03ee059-c9c2-428a-a726-4677f304a7b0/public_url)
- 🏅 [Google Cloud Associate Cloud Engineer](https://www.credly.com/badges/22ff9aef-345f-4e88-9d13-1faaef7a7a72/public_url)
- 🏅 [Databricks Certified Data Engineer Associate](https://credentials.databricks.com/04d46d50-c635-486d-9a85-d934635285f9#acc.YQZmDdz0)

---

## Featured Data Engineering Projects

### [Real-Time Streaming Pipeline](/blogs/2026/04/02/streaming_data_processing_pipeline/)
Python · Apache Flink (PyFlink) · Kafka (Redpanda) · PostgreSQL · Docker

### [Cricket Analytics Pipeline](/blogs/2026/02/16/cricket_analytics_pipeline/)
Python · Apache Airflow · Google Cloud Storage · Dataflow · BigQuery · Cloud Functions · Pub/Sub

### Enterprise Talend to Apache Airflow Migration
Orchestrated migration of legacy Talend workflows to Apache Airflow DAGs on Cloud Composer; improved pipeline reliability and observability.

---

## Latest Blog Posts

<ul style="list-style: none; padding-left: 0;">
  {% for post in site.posts limit:5 %}
  <li style="margin-bottom: 1em;">
    <div style="color: #888;">
      {{ post.date | date: "%b %-d, %Y" }}
    </div>

    <a href="{{ post.external_url | default: post.url }}"
       style="font-size: 1.1em; font-weight: 600; text-decoration: none; color: #007acc;">
      {{ post.title }}
    </a>
  </li>
  {% endfor %}
</ul>

[View all posts →](/blogs/)

---

## AI/ML Research & Hackathons

1. **AMD AI Sprint Hackathon 2025 — 4th Place**  
   Built a Question/Answer Agent system using Qwen3-4B at IISc, sponsored by Hugging Face and Meta.  
   [Repository](https://github.com/NShravanReddy/AMD_AI_AGENTS)

2. **OpenAI Open Model Hackathon**  
   Fine-tuned GPT-Oss-20B to generate Triton GPU kernels using a custom PEFT dataset.  
   [Research Document](https://nsr6.notion.site/Create-an-llm-agent-to-write-triton-kernels-24205b97e27e80708b23e54cfb4b96fd)

3. **LLM Kernel Agent (Cerebras x Cline Vibe Coder Hackathon)**  
   Agent that accepts natural language prompts and generates optimized Triton GPU kernel code via Cerebras Inference API.  
   [Streamlit App](https://llm-kernel.streamlit.app) · [Repository](https://github.com/NShravanReddy/LLM-Kernel-Agent/)

4. **AMD GPU Kernel Optimization Challenge**  
   Wrote high-performance FP8 GEMM kernels for MI300X GPUs using Triton with per-group scaling.  
   [Documentation](https://nshravanreddy.github.io/DeepLearning/triton-guide)

---

## Connect

[GitHub](https://github.com/NShravanReddy)
