---
layout: default
title: Blog
---

## Posts

{% comment %}
This loop automatically lists all posts in _posts/, sorted by date (newest first).
{% endcomment %}

<ul style="list-style: none; padding-left: 0;">
  <li style="margin-bottom: 1em;">
    <div style="color: #888;">Oct 24, 2025</div>
    <a href="/blogs/2025/10/24/gpt-oss-20b-triton-kernel/" style="font-size: 1.1em; font-weight: 600; text-decoration: none; color: #007acc;">
      GPT-OSS-20B-Triton-Kernel: Fine-Tuning a 20B Model to Generate GPU Kernels
    </a>
  </li>
  <li style="margin-bottom: 1em;">
    <div style="color: #888;">Jan 28, 2025</div>
    <a href="https://www.notion.so/nsr6/UV-18905b97e27e8063926dec9973e3996f" style="font-size: 1.1em; font-weight: 600; text-decoration: none; color: #007acc;">
      UV
    </a>
  </li>
  <li style="margin-bottom: 1em;">
    <div style="color: #888;">May 2, 2024</div>
    <a href="https://heymachinelearning.hashnode.dev/installing-pytorch-on-arm-macm1m2m3" style="font-size: 1.1em; font-weight: 600; text-decoration: none; color: #007acc;">
      Installing PyTorch on ARM Mac (M1/M2/M3)
    </a>
  </li>
  <li style="margin-bottom: 1em;">
    <div style="color: #888;">Feb 24, 2024</div>
    <a href="/blogs/2024/02/24/introduction-to-weight-quantization/" style="font-size: 1.1em; font-weight: 600; text-decoration: none; color: #007acc;">
      Introduction to Weight Quantization
    </a>
  </li>
  <li style="margin-bottom: 1em;">
    <div style="color: #888;">Jan 10, 2024</div>
    <a href="https://www.notion.so/nsr6/Installing-tensor-flow-on-Mac-m1-629604ff25274165b0d23c0cbdb064d0?source=copy_link" style="font-size: 1.1em; font-weight: 600; text-decoration: none; color: #007acc;">
      Installing TensorFlow on Mac M1
    </a>
  </li>
  <li style="margin-bottom: 1em;">
    <div style="color: #888;">Jan 1, 2024</div>
    <a href="https://nsr6.notion.site/AWS-a70b1f8b7ba344bab19ed7df3e9eff7f" style="font-size: 1.1em; font-weight: 600; text-decoration: none; color: #007acc;">
      AWS
    </a>
  </li>
  <li style="margin-bottom: 1em;">
    <div style="color: #888;">Jan 1, 2024</div>
    <a href="/blogs/2024/01/01/downloading-llm-from-hf/" style="font-size: 1.1em; font-weight: 600; text-decoration: none; color: #007acc;">
      Downloading the LLM model from Hugging Face
    </a>
  </li>
  <li style="margin-bottom: 1em;">
    <div style="color: #888;">2024</div>
    <a href="https://heymachinelearning.hashnode.dev/installing-tensor-flow-on-arm-macm1m2m3" style="font-size: 1.1em; font-weight: 600; text-decoration: none; color: #007acc;">
      Installing TensorFlow on ARM Mac (M1/M2/M3)
    </a>
  </li>
  <li style="margin-bottom: 1em;">
    <div style="color: #888;">2024</div>
    <a href="https://heymachinelearning.hashnode.dev/neural-networks" style="font-size: 1.1em; font-weight: 600; text-decoration: none; color: #007acc;">
      Neural Networks
    </a>
  </li>
  <li style="margin-bottom: 1em;">
    <div style="color: #888;">2024</div>
    <a href="https://heymachinelearning.hashnode.dev/functions-of-machine-learning" style="font-size: 1.1em; font-weight: 600; text-decoration: none; color: #007acc;">
      Functions of Machine Learning
    </a>
  </li>
  <li style="margin-bottom: 1em;">
    <div style="color: #888;">2024</div>
    <a href="https://heymachinelearning.hashnode.dev/types-of-machine-learning" style="font-size: 1.1em; font-weight: 600; text-decoration: none; color: #007acc;">
      Types of Machine Learning
    </a>
  </li>
  <li style="margin-bottom: 1em;">
    <div style="color: #888;">Dec 18, 2023</div>
    <a href="https://www.notion.so/nsr6/Tensorflow-2bc1c8d79a65489aa77b2c842d1a0d1b?source=copy_link" style="font-size: 1.1em; font-weight: 600; text-decoration: none; color: #007acc;">
      Tensorflow
    </a>
  </li>
  <li style="margin-bottom: 1em;">
    <div style="color: #888;">Jul 7, 2023</div>
    <a href="https://nsrai.hashnode.dev/python-1" style="font-size: 1.1em; font-weight: 600; text-decoration: none; color: #007acc;">
      Python on Hashnode
    </a>
  </li>
  {% for post in site.posts %}
    <li style="margin-bottom: 1em;">
      <div style="color: #888;">{{ post.date | date: "%b %d, %Y" }}</div>
      <a href="{{ post.url | relative_url }}" style="font-size: 1.1em; font-weight: 600; text-decoration: none; color: #007acc;">
        {{ post.title }}
      </a>
    </li>
  {% endfor %}
</ul>

---

<footer>
  <div style="text-align: center; padding: 20px; margin-top: 40px;">
    <p>&copy; 2025 Shravan Reddy</p>
    <div style="margin-top: 10px;">
      <a href="https://github.com/NShravanReddy" style="margin: 0 10px; text-decoration: none; color: #333; font-size: 24px;">Github</a>
      <a href="https://x.com/nshravanr" style="margin: 0 10px; text-decoration: none; color: #333; font-size: 24px;">X</a>
    </div>
  </div>
</footer>