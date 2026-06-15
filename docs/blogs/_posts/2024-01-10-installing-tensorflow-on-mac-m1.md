---
layout: post
title: "Installing TensorFlow on Mac M1"
date: 2024-01-10
tags: [TensorFlow, macOS, Setup, Deep Learning]
---

*January 10, 2024*

Step-by-step guide to install TensorFlow on Apple Silicon (M1) Mac.

### Install Miniforge

```bash
brew install miniforge
```

### Setup TensorFlow Environment

```bash
mkdir tensorflow
cd tensorflow
conda activate env
```

### Install TensorFlow Dependencies

```bash
conda install -c apple tensorflow-deps
```

### Install TensorFlow

```bash
python -m pip install tensorflow
```

### Install Metal Plugin (Apple Silicon)

```bash
python -m pip install tensorflow-metal
```

### Install Additional Packages

```bash
conda install jupyter pandas numpy matplotlib scikit-learn

---

[Notion](https://app.notion.com/p/nsr6/Installing-tensor-flow-on-Mac-m1-629604ff25274165b0d23c0cbdb064d0)

