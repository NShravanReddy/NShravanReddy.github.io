---
layout: post
title: "Streaming Data Processing Pipeline"
date: 2026-04-02
last_modified_at: 2026-04-02
categories: data-engineering
permalink: /blogs/2026/04/02/streaming_data_processing_pipeline/
---

### 1. **Streaming Data Processing Pipeline**

A real-time data processing pipeline using **Apache Flink** (PyFlink), **Kafka** (Redpanda), and **PostgreSQL** to process NYC taxi ride events. This project demonstrates streaming data ingestion, transformation, and storage.

**Tech Stack:** Python, Apache Flink (PyFlink), Kafka (Redpanda), PostgreSQL, Docker

**Key Features:**
- Real-time data producers generating NYC taxi ride events
- Stream processing with Apache Flink (PyFlink)
- Multiple processing strategies (pass-through and time-windowed aggregations)
- Event watermarking for handling late-arriving data
- Checkpointing for fault tolerance
- Docker Compose setup for local development

**Architecture:**
- Kafka Producer (rides topic) → Redpanda (Kafka) → Flink Jobs → PostgreSQL

**Repository:** [GitHub](https://github.com/NShravanReddy/streaming)

