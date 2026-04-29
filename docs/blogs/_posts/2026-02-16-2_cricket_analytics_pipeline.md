---
layout: post
title: "2_Cricket_Analytics_Pipeline"
date: 2026-02-16
categories: data-engineering
---

### 2. **Cricket Statistics Data Pipeline (GCP + Airflow + BigQuery)**

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