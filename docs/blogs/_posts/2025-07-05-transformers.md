# Transformers

27/10/2023


https://arxiv.org/html/1706.03762v7

[We compress any BF16 model to ~70% size during inference, while keeping the output LOSSLESS so that you can fit in more ERP context or run larger models.](https://www.reddit.com/r/LocalLLaMA/comments/1k7o89n/we_compress_any_bf16_model_to_70_size_during/)

[https://github.com/LeanModels/DFloat11](https://github.com/LeanModels/DFloat11)


[Transformers, what can they do?](https://huggingface.co/learn/nlp-course/chapter1/3?fw=pt#transformers-what-can-they-do)

[Transformers are everywhere!](https://huggingface.co/learn/nlp-course/chapter1/3?fw=pt#transformers-are-everywhere)

[Working with pipelines](https://huggingface.co/learn/nlp-course/chapter1/3?fw=pt#working-with-pipelines)

[Zero-shot classification](https://huggingface.co/learn/nlp-course/chapter1/3?fw=pt#zero-shot-classification)

[Text generation](https://huggingface.co/learn/nlp-course/chapter1/3?fw=pt#text-generation)

[Using any model from the Hub in a pipeline](https://huggingface.co/learn/nlp-course/chapter1/3?fw=pt#using-any-model-from-the-hub-in-a-pipeline)

[The Inference API](https://huggingface.co/learn/nlp-course/chapter1/3?fw=pt#the-inference-api)

[Mask filling](https://huggingface.co/learn/nlp-course/chapter1/3?fw=pt#mask-filling)

[Named entity recognition](https://huggingface.co/learn/nlp-course/chapter1/3?fw=pt#named-entity-recognition)

[Question answering](https://huggingface.co/learn/nlp-course/chapter1/3?fw=pt#question-answering)

Llm definations (1)

1. Tokenization
2. Transformer diagram
3. Training problem:  next word/token prediction task
4. Fine-tuning? Taking an existing model and training it further to exhibit custom behaviours or knowledge
5. fine tuning causes catastrophic issues so we use vector dbs
6. RLHF
7. Asking llm a question is called prompting(Inputting tokens into the model to allow it to generate and predict text that is likely to be correct,)

1)Temperature: Measure of randomness and creativity in a model
2)Top P: Another measure of randomness that accounts for how much the model should account for low probability
Note: It is recommended to only use one : temperature or top_p at a time
3)Frequency Penalty: Penalized repeated tokens based on frequency 

4)Presence Penalty: Penalizes repeated tokens in general

Transformers 

https://arxiv.org/html/1706.03762v7

[We compress any BF16 model to ~70% size during inference, while keeping the output LOSSLESS so that you can fit in more ERP context or run larger models.](https://www.reddit.com/r/LocalLLaMA/comments/1k7o89n/we_compress_any_bf16_model_to_70_size_during/)

[https://github.com/LeanModels/DFloat11](https://github.com/LeanModels/DFloat11)



what is the transformer?

It has the two blocks

1. Encoder block
2. Decoder block

![encoder 2025-06-21 at 4.09.14 PM.png](/blogs/images/encoder_2025-06-21_at_4.09.14_PM.png)

# Encoder Block

The encoder  block we will be passing the input embedding and positional encoding 


Notes:

DRam - cpu

Flash attention

SRAM - L2 cache and it's speed

Saves billion dolars in running lms.

Reading gpt-2 paper-Language Models are Unsupervised Multitask Learners

Zero-shot, one-shot and few-shot, contrasted with traditional fine-tuning

[https://www.zotero.org/nshravanreddy/collections/46SWDQAD/items/Q5MCK7KK/attachment/W3A7KLU7/reader](https://www.zotero.org/nshravanreddy/collections/46SWDQAD/items/Q5MCK7KK/attachment/W3A7KLU7/reader)

finetuning is continual pretraining, clinical modern bert in the ideas read research paper to implement chemistry modern bert,8 NVIDIA H100 SXM5 GPUs refers to a system containing eight NVIDIA H100 GPUs in the SXM5 form factor

Notion links: 

[Transformer](https://app.notion.com/p/Transformer-21a05b97e27e8013b071ef794ccd4e71?pvs=21)


[Transformers](https://app.notion.com/p/nsr6/Transformers-22605b97e27e801eb5f9d31fb0af8d85?source=copy_link)
[Notion](https://nsr6.notion.site/Pyspark-34905b97e27e80a7a976cd786db8bd3b)*
