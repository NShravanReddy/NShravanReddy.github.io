# Unified Jekyll Config

Date: 2026-06-16

## Problem

The repository had two Jekyll config files, `docs/_config.yml` and `docs/blogs/_config.yml`, which made it unclear which config controlled local development and GitHub Pages.

## Discussion

The intended project root is `docs/`, so `docs/_config.yml` should be the single active Jekyll config for both local serving and GitHub Pages deployment. The nested `docs/blogs/_config.yml` represented an older blog-only site root and could confuse future edits.

## Code / Commands

```text
docs/_config.yml
```

## Solution

Removed `docs/blogs/_config.yml` and updated `docs/SETUP.md` to document `docs/_config.yml` as the only active Jekyll config. The setup guide now points to `docs/_layouts/post.html` for the blog post layout.

## Files Changed

* `docs/SETUP.md`
* `docs/blogs/_config.yml`
* `logs/2026/06-Jun.md`
* `logs/2026/conversations/2026-06-16_unified_jekyll_config.md`

## Final Result

Local development and GitHub Pages are documented around one Jekyll config: `docs/_config.yml`. Blog content, dates, sorting, and generated `_site` output were not changed.
