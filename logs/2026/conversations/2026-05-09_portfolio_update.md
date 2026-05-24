# 2026-05-09 Portfolio Update

## Context

The Data Engineering project links on the portfolio home page were not opening correctly after deployment to GitHub Pages.

## Issue

Two problems caused the broken or empty pages:

- The home page links pointed to root-level URLs such as `/2026/...`, but the posts live under the blog path `/blogs/...`.
- Two post filenames used an underscore immediately after the date, which Jekyll does not treat as a valid post filename.

## Fix

Updated the project links in `docs/index.md`:

- `/blogs/2026/04/02/streaming_data_processing_pipeline/`
- `/blogs/2026/02/16/cricket_analytics_pipeline/`

Renamed the project post files to valid Jekyll post names:

- `docs/blogs/_posts/2026-04-02-streaming_data_processing_pipeline.md`
- `docs/blogs/_posts/2026-02-16-cricket_analytics_pipeline.md`

Added explicit permalinks to both project posts so the generated URLs match the links exactly.

## Lesson

For Jekyll posts, filenames must follow this pattern:

```text
YYYY-MM-DD-title.md
```

When a post is inside `docs/blogs/_posts`, the portfolio link should include the `/blogs/` prefix.
