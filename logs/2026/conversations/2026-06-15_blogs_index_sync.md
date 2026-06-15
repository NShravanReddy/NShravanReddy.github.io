# Blog Index Manual Sync

Date: 2026-06-15

## Problem

The blog homepage `docs/index.md` and the blog page `docs/blogs/index.md` had manually maintained lists that were out of sync with the actual blog post publication dates.

## Discussion

Updated the homepage blog list and replaced the hardcoded blog page list with a Jekyll `site.posts` loop so posts are rendered based on actual `_posts` metadata.

## Code / Commands

```md
# docs/index.md
# docs/blogs/index.md
# logs/2026/06-Jun.md
```

## Solution

- Kept `docs/index.md` blog entries ordered by date and removed the duplicate/ambiguous entries.
- Converted `docs/blogs/index.md` to automatically render blog posts from `site.posts`.
- Added a June 2026 log entry pointing to this note.

## Files Changed

* docs/index.md
* docs/blogs/index.md
* logs/2026/06-Jun.md

## Final Result

Blog listings are now synchronized with the repository's blog metadata and tracked in repo logs.
