---
layout: post
title: "Kimball's Dimensional Modelling"
date: 2026-05-24
tags: [Data Engineering, Data Modeling, Kimball]
---

*May 24, 2026*

To deliver data **understandable to the business users** and deliver **fast query performance**.

The priority is **user understandability** and **query performance** over non-redundant data (3NF). **Normalization** is the process of organizing tables in a database to reduce redundancy and dependency by splitting large tables into smaller related tables.

## Fact Table

A fact table is located at the middle of a star or snowflake schema surrounded by dimensional models. A fact table typically has two types of columns: those that contain facts and those that are a foreign key to dimension tables.

The **grain** is the business definition of what a single fact table record represents.

> *Example: Grain is the description of the measurement event in the physical world that gives rise to a measurement. When the grocery store scanner measures the quantity and the charged price of a product being purchased, the grain is literally the beep of the scanner.*

The real purpose is to be the repository of the numeric facts that are observed during the measurement event.

### Types of Fact Tables

| Type | Description | Example |
| --- | --- | --- |
| Transaction Fact | One row per event | Order details |
| Snapshot Fact | Periodic state | Bank reports |
| Accumulating Snapshot | Lifecycle tracking | Food delivery |
| Factless Fact | Event tracking without measures | Student Attendance |

## Dimension Table

A **dimension table** stores descriptive information about business entities. It stores descriptive attributes about a business entity such as customers, sales.

- Contains one primary key that acts as relationship to join foreign key in fact table
- Dimensions come in 2 flavors:
  - **Slowly Changing (SCD)**
  - **Fixed**

## Schema Types

1. **Star Schema** — One fact table and many dimensional tables
2. **Snowflake Schema** — One or more fact tables and many dimensional tables (more normalized)

**Fact table:** contains numeric data
**Dimension table:** contains descriptive data

[Fact Tables - Kimball Group](https://www.kimballgroup.com/2008/11/fact-tables/)

---

[Notion](https://nsr6.notion.site/Kimball-s-Dimensional-Modelling-36205b97e27e808db853dfaf8f9ec989)

