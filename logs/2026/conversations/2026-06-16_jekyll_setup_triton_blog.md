# Jekyll Local Setup & LLM Agent Triton Kernels Blog Post

Date: 2026-06-16

## Problem

Jekyll site needed local deployment setup, Google Analytics, "Last modified" date display, and the "LLM Agent for Triton Kernels" blog post from Notion needed proper formatting and integration.

## Discussion

### Local Deployment
- System Ruby was 2.6.10 — too old for Jekyll 4.4 (requires >= 2.7.0)
- Installed rbenv + ruby-build via Homebrew
- Installed Ruby 3.2.2 via rbenv
- Created `Makefile` with `setup`, `serve`, `build`, `clean` targets
- Created `docs/SETUP.md` with full step-by-step setup documentation

### Google Analytics
- Added `google_analytics: G-JLPX0QK3WW` to both `docs/_config.yml` and `docs/blogs/_config.yml`
- Minima theme auto-injects GA script into `<head>` on all pages

### Last Modified Date
- Created custom `docs/blogs/_layouts/post.html` overriding minima's layout
- Displays "Last modified" when `last_modified_at` field exists in frontmatter
- Added `last_modified_at: 2026-06-16` to all 22 blog posts

### LLM Agent Triton Kernels Blog Post
- Created from Notion raw export (daily journal format)
- New post: `docs/blogs/_posts/2025-08-02-llm-agent-triton-kernels.md`
- Reference files moved to `docs/blogs/llm-agent-triton-references/`
- Image moved to `docs/blogs/images/Screenshot_2025-08-24_at_3.41.09_PM.png`
- Table formatted as pure markdown with links in Reference column
- Anchor links added: `#google-colab`, `#gpt-oss-20b-triton-kernel`

## Files Changed

- `Makefile` (new)
- `docs/SETUP.md` (new)
- `docs/_config.yml` (added google_analytics)
- `docs/blogs/_config.yml` (added google_analytics)
- `docs/blogs/_layouts/post.html` (new — minima override)
- `docs/blogs/_posts/2025-08-02-llm-agent-triton-kernels.md` (new)
- `docs/blogs/llm-agent-triton-references/` (new folder with 3 reference files)
- `docs/blogs/images/Screenshot_2025-08-24_at_3.41.09_PM.png` (moved)
- `.ruby-version` (created by rbenv)
- `docs/Gemfile.lock` (generated)
- All 22 blog posts (added `last_modified_at` to frontmatter)

## Final Result

Jekyll site fully set up locally with:
- Working `make serve` command
- Google Analytics tracking on all pages
- "Last modified" date display on all blog posts
- Properly formatted LLM Agent Triton Kernels blog post with clean markdown tables and working anchor links