# Homepage redesign and content update

Date: 2026-06-22

## Problem

The homepage (`docs/index.md`) was outdated with a minimal description, no experience highlights, no skills section, no certifications, and a flat blog listing showing all posts. The hackathon section had verbose descriptions that needed to be compacted.

## Discussion

Completely restructured the homepage to better showcase Cloud Data Engineering expertise. Added structured sections for Experience Highlights, Skills, Certifications, Featured Data Engineering Projects (with a new Enterprise Talend migration entry), and a compact AI/ML Research & Hackathons section. Blog listing now shows only the latest 5 posts with a "View all posts" link.

## Code / Commands

No code changes beyond markdown content.

## Solution

The following changes were made to `docs/index.md`:

- Updated meta description to mention GCP services and certifications
- Changed title from "Shravan Reddy" to "Shravan Reddy — Cloud Data Engineer"
- Replaced generic intro with structured experience highlights (2.5+ years, production pipelines)
- Added Skills section with Languages, Cloud, Orchestration, Streaming, ML/AI
- Added Certifications section with 3 badges (GCP Professional Data Engineer, Associate Cloud Engineer, Databricks Data Engineer Associate)
- Replaced verbose hackathon descriptions with 1-line summaries
- Added "Enterprise Talend to Apache Airflow Migration" as a featured project
- Limited blog posts to 5 (was showing all)
- Added "View all posts →" link
- Renamed "Repositories" to "Connect" with GitHub, X/Twitter, DeepLearning Repo, DSA links

## Files Changed

- `docs/index.md`
- `docs/blogs/index.md` (removed X/Twitter link)

## Final Result

Homepage now has a professional, structured layout that effectively communicates data engineering expertise, certifications, featured projects, and links to blog content.