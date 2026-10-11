# Homepage AI/ML Section and Experience Update

Date: 2026-09-18

## Problem

The homepage intro still showed 2.7+ years of experience, and the "AI/ML Research & Hackathons" section was a bare list without context. Some hackathon entries were missing project links, and the AMD GPU kernel entry only covered a single challenge.

## Discussion

- Bumped the intro experience from 2.7+ to 2.8+ years.
- Added a short paragraph above the AI/ML list explaining the exploration of ML models, LLMs, hackathons, and GPU kernel/Triton work.
- Added Hugging Face Model and Devpost video links to the OpenAI Open Model Hackathon entry.
- Renamed "AMD GPU Kernel Optimization Challenge" to "AMD GPU Kernel Optimization & Triton Journey", added a summary of the two AMD GPU kernel competitions, and linked the DeepLearning repository and Triton guide.

## Code / Commands

```markdown
I am a Cloud Data Engineer with 2.8+ years of experience building production-grade ETL/ELT pipelines, automating data workflows, and designing reliable, scalable data solutions. I also write technical blogs to share what I learn and build.
```

```markdown
## AI/ML Research & Hackathons

I have been exploring machine learning models and LLMs to understand how they work and learn more about the AI. As part of this journey, I participated in a few hackathons and worked on projects involving LLMs, GPU kernels, and Triton, which helped me gain hands-on experience and learn new areas of deep learning.
```

## Solution

Homepage `docs/index.md` updated with the new experience figure, section intro, extra hackathon links, and the reworked AMD Triton Journey entry.

## Files Changed

* docs/index.md

## Final Result

Homepage AI/ML section now has context, complete project links, and an updated experience figure. Committed as `2026-09-18_homepage_ai_ml_section_and_experience_update`.