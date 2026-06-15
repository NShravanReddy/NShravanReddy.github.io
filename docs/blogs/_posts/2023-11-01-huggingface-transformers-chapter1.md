---
layout: post
title: "Hugging Face Transformers Working Chapter 1"
date: 2023-11-01
tags: [HuggingFace, Transformers, NLP]
---

*November 1, 2023*

High level `pipeline()` function in Transformers.

```python
from transformers import pipeline

pipeline("fill-mask", model="bert-base-uncased")
```

| Model | Training | Data | Time |
| --- | --- | --- | --- |
| Pretrained model | Scratch | Large data | Several weeks |
| Fine-tuned model | Using Pre-trained model | Using Specific data | Low |

### Transfer Learning

The fine-tuned model acquires the knowledge from the pretrained model.

| [Encoder](https://huggingface.co/learn/nlp-course/chapter1/5?fw=pt) | [Decoder](https://huggingface.co/learn/nlp-course/chapter1/6?fw=pt) |
| --- | --- |
| Optimised to understand input features | Uses encoder features along with other input to generate target sequences |
| Bi-directional and auto-encoding models | Auto-regressive models |
| Sentence classification, named entity recognition (and more generally word classification), and extractive question answering | Text generation |
| Encoder can access all the words in the initial sentence | Attention layers can only access the words positioned before a given word in the input |

Encoder-decoder models (also called *sequence-to-sequence models*) are used in generating summarization, translation, or generative question answering.

[Attention is all you need](https://arxiv.org/abs/1706.03762)

| Architecture | Definition of Layers and operations in model |
| --- | --- |
| Checkpoints | Weights loaded into architecture |
| Model | Architecture and checkpoints |

---

[Notion](https://app.notion.com/p/nsr6/Hugging-face-Transformers-working-chapter-1-37f05b97e27e800f86c8c0e355766187)*

[Notion](https://nsr6.notion.site/Pyspark-34905b97e27e80a7a976cd786db8bd3b)*
