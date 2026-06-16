---
layout: post
title: "Hugging Face Chapter 2 — Behind the Pipeline"
date: 2023-11-03
last_modified_at: 2023-11-03
tags: [HuggingFace, Transformers, NLP]
---

*November 3, 2023*

## Behind the Pipeline

**Tokenizer → Model → Pipeline**

- Preprocessing → Inputs to model → Postprocessing

### Tokenizer

Split input into words, subwords, or symbols (like punctuation) that are called *tokens*.

- `AutoTokenizer`
- `TFAutoModel`
- `TFAutoModelForSequenceClassification`

### Models

```python
config = BertConfig()
model = TFBertModel(config)
```

But using default config requires more time and lots of data. So we use `from_pretrained()`.

### Saving a Model

```python
model.save("")
```

Saved files:
- `config.json`
- `tf_model.h5`

### Using a Pretrained Model

```python
from transformers import TFBertModel

model = TFBertModel.from_pretrained("bert-base-cased")
```

### Encoded Sequences

```python
encoded_sequences = [
    [101, 7592, 999, 102],
    [101, 4658, 1012, 102],
    [101, 3835, 999, 102],
]
```

```python
import tensorflow as tf

model_inputs = tf.constant(encoded_sequences)
output = model(model_inputs)
```

[How to Use the Keras Functional API for Deep Learning](https://machinelearningmastery.com/keras-functional-api-deep-learning/)

---

[Notion](https://app.notion.com/p/nsr6/Hugging-face-chapter-2-37f05b97e27e80b99697e277c3f5bfc9)

