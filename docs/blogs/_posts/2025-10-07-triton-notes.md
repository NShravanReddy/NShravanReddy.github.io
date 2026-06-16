---
layout: post
title: "Triton Notes"
date: 2025-10-07
last_modified_at: 2025-10-07
tags: [Triton, GPU, Kernel, Deep Learning]
---

*October 7, 2025*

Notes on Triton GPU kernel programming, MoE, and MLA.

### Stride in Memory

- **Stride for dimension 0** = how much you jump in memory to go from `row[i]` to `row[i+1]`.
- **Stride for dimension 1** = how much you jump in memory to go from `col[j]` to `col[j+1]` inside the same row.

[ChatGPT - Stride in PyTorch](https://chatgpt.com/share/68105b76-ef7c-8004-a72c-f217d9449830)

### MoE (Mixture of Experts)

![moe.png](/blogs/images/moe.png)

An expert consists of input, a linear neural network 1, passing the output through activation, then to linear 2 and output.

There are two types of experts:

1. **Expert** (standard)
2. **Shared Expert**

**Router** passes input to tokens, then to Expert 1, Expert 2, ..., Expert n → summation of the output.

Input is passed to token and to one Shared Expert, gets output. These two outputs are summed up.

```
f(x) = w_down(silu(w_gate) * (w_up))

silu = self.act_fn(self.W_gate(x))
gate = silu(self.W_gate(x))
f(x) = self.W_down(gate * (self.W_up(x)))
```

### MLA (Multi-head Latent Attention)

Reading DeepSeek paper 2.1 completed.

[ChatGPT conversation](https://chatgpt.com/share/68e47108-d07c-8004-96f2-647d14df61af)

---

[Notion](https://app.notion.com/p/nsr6/Triton-1e405b97e27e800bb7dec1ce8b4419de)