---
layout: post
title: "Introduction to Weight Quantization"
date: 2025-02-03
tags: [Quantization, LLM, Deep Learning]
---

*February 3, 2025*

Memory required to store the smallest LLaMA 2 7B which has 7 billion parameters. Size of each parameter is 32-bit, so we need:

```
7 × 10^9 / 8 × 10^9 × 32 = 28 GB
```

However, to save memory, weights can be stored using lower-precision data types through a process known as **quantization**.

### Post-Training Quantization (PTQ)

A straightforward technique where the weights of an already trained model are converted to lower precision without necessitating any retraining. Although easy to implement, PTQ is associated with potential performance degradation.

### Quantization-Aware Training (QAT)

Incorporates the weight conversion process during the pre-training or fine-tuning stage, resulting in enhanced model performance. However, QAT is computationally expensive and demands representative training data.

![Screenshot 2025-02-03 at 11.44.54 AM.png](/blogs/images/Screenshot_2025-02-03_at_11.44.54_AM.png)

---

## 1) Naive 8-bit Quantization

**Outlier features** are extreme values (negative or positive) that appear in all transformer layers when the model reaches a certain scale (>6.7B parameters). This is an issue since a single outlier can reduce the precision for all other values. Discarding these outlier features would **greatly degrade** the model's performance.

Two types:
1. **Absolute maximum (absmax) quantization**
2. **Zero-point quantization** (asymmetric)

[Google Colab - Absmax & Zero-point](https://colab.research.google.com/drive/1_pRQl1cESfIg4e6O-FfjSrCbTeFuXoAR#scrollTo=PImzaSeEjN7e&uniqifier=2)

### Solution: 8-bit Quantization with LLM.int8()

[Google Colab - LLM.int8()](https://colab.research.google.com/drive/1yCakZcTr5TTSFcRfvj1h80LvXooiKJmp#scrollTo=ooK8lhxGewXg)

**Notes:**
1. HF Hub does not support direct saving of quantized weights. The uploaded model retains the quantization config. When you load it, it will be re-quantized at runtime.
2. For GGUF saving, use a conversion tool (like `transformers.gguf` or `llama.cpp`).

---

## 2) 4-bit LLM Quantization with GPTQ

---

## 3) Quantize Llama Models with GGUF and llama.cpp

Using llama.cpp load GGML models and **run them on a CPU**. Originally, this was the main difference with GPTQ models, which are loaded and run on a GPU. However, you can now offload some layers of your LLM to the GPU with llama.cpp.

There are **14 different GGML models**, corresponding to different types of quantization.

| Variant | Description |
| --- | --- |
| `q2_k` | Q4_K for attention.vw and feed_forward.w2 tensors, Q2_K for other tensors |
| `q3_k_l` | Q5_K for attention.wv, attention.wo, feed_forward.w2, else Q3_K |
| `q3_k_m` | Q4_K for attention.wv, attention.wo, feed_forward.w2, else Q3_K |
| `q3_k_s` | Q3_K for all tensors |
| `q4_0` | Original quant method, 4-bit |
| `q4_1` | Higher accuracy than q4_0 but not as high as q5_0, quicker inference than q5 |
| `q4_k_m` | Q6_K for half of attention.wv and feed_forward.w2, else Q4_K |
| `q4_k_s` | Q4_K for all tensors |
| `q5_0` | Higher accuracy, higher resource usage, slower inference |
| `q5_1` | Even higher accuracy, resource usage, slower inference |
| `q5_k_m` | Q6_K for half of attention.wv and feed_forward.w2, else Q5_K |
| `q5_k_s` | Q5_K for all tensors |
| `q6_k` | Q8_K for all tensors |
| `q8_0` | Almost indistinguishable from float16, high resource use, slow |

**Recommendation:** Use **Q5_K_M** as it preserves most of the model's performance. Alternatively, use **Q4_K_M** if you want to save memory. K_M versions are better than K_S versions. Q2_K or Q3_* versions drastically decrease model performance.

- [GGML models on HF](https://huggingface.co/TheBloke/Llama-2-13B-chat-GGML/tree/main)
- [Perplexity comparison](https://oobabooga.github.io/blog/posts/perplexities/)
- [Google Colab - Quantization](https://colab.research.google.com/drive/13jjm2uWKR27SI9KeAFb2zTFFd2BRQh9_#scrollTo=I7S32Y9QwJrE)
- [Google Colab - Working example](https://colab.research.google.com/drive/1XGcGFjXFW0JqVXfL8vbkG3rd-sdjv0ou?authuser=1#scrollTo=2Vogtm_lyL9K)

---

## ExLlamaV2: The Fastest Library to Run LLMs

A script is provided to quantize models. Converting large models can be somewhat slow. The conversion script and its options are explained in [detail here](https://github.com/turboderp-org/exllamav2/blob/master/doc/convert.md).

[ExLlamaV2 Guide](https://mlabonne.github.io/blog/posts/ExLlamaV2_The_Fastest_Library_to_Run%C2%A0LLMs.html)

Reduces the amount of bits required to represent each parameter, converting floating point into integers.

![image.png](/blogs/images/image.png)
![Screenshot 2025-02-08 at 3.50.55 PM.png](/blogs/images/Screenshot_2025-02-08_at_3.50.55_PM.png)
![Screenshot 2025-02-08 at 3.52.35 PM.png](/blogs/images/Screenshot_2025-02-08_at_3.52.35_PM.png)

---

[Notion](https://app.notion.com/p/nsr6/2bc1c8d79a65489aa77b2c842d1a0d1b)*