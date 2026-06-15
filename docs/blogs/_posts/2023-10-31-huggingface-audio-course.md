---
layout: post
title: "Hugging Face Audio Course"
date: 2023-10-31
tags: [HuggingFace, Audio, NLP]
---

*October 31, 2023*

[Introduction to audio data - Hugging Face Audio Course](https://huggingface.co/learn/audio-course/chapter1/audio_data)

### Vectorizer Class

```python
import string

class Vectorizer:
    def standardize(self, text):
        text = text.lower()
        return "".join(char for char in text if char not in string.punctuation)

    def tokenize(self, text):
        text = self.standardize(text)
        return text.split()

    def make_vocabulary(self, dataset):
        self.vocabulary = {"": 0, "[UNK]": 1}
        for text in dataset:
            text = self.standardize(text)
            tokens = self.tokenize(text)
            for token in tokens:
                if token not in self.vocabulary:
                    self.vocabulary[token] = len(self.vocabulary)
        self.inverse_vocabulary = dict((v, k) for k, v in self.vocabulary.items())

    def encode(self, text):
        text = self.standardize(text)
        tokens = self.tokenize(text)
        return [self.vocabulary.get(token, 1) for token in tokens]

    def decode(self, int_sequence):
        return " ".join(
            self.inverse_vocabulary.get(i, "[UNK]") for i in int_sequence
        )
```

### Usage

```python
vectorizer = Vectorizer()
dataset = [
    "I write, erase, rewrite",
    "Erase again, and then",
    "A poppy blooms.",
]
vectorizer.make_vocabulary(dataset)
```

It does the job:

*Haiku by poet Hokushi*

```python
>>> test_sentence = "I write, rewrite, and still rewrite again"
>>> encoded_sentence = vectorizer.encode(test_sentence)
>>> print(encoded_sentence)
[2, 3, 5, 7, 1, 5, 6]

>>> decoded_sentence = vectorizer.decode(encoded_sentence)
>>> print(decoded_sentence)
"i write rewrite and [UNK] rewrite again"
```

![Screenshot 2023-10-31 at 7.37.14 PM.png](/blogs/images/Screenshot_2023-10-31_at_7.37.14_PM.png)

---

[Notion](https://app.notion.com/p/nsr6/Hugging-face-audio-course-37f05b97e27e806f8e05e8532a87a72d)

[Notion](https://nsr6.notion.site/Pyspark-34905b97e27e80a7a976cd786db8bd3b)*
