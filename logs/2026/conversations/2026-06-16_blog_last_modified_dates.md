# Blog Last Modified Dates

Date: 2026-06-16

## Problem

Blog posts needed to show a last modified date inside each post without changing the existing blog index ordering or index date display.

## Discussion

The blog is a Jekyll site under `docs/blogs`. Blog list pages already iterate over `site.posts`, which Jekyll sorts by the publish `date` field by default. The change therefore needed to add a separate metadata field for last modified dates and render that field in the post layout without changing the loop, sort behavior, or index date display.

Two older posts did not have YAML front matter, so they were normalized to use the same `layout: post`, `title`, `date`, and `last_modified_at` metadata as the rest of the posts.

## Code / Commands

```liquid
{%- if page.last_modified_at -%}
  &middot; Last modified date {{ page.last_modified_at | date: date_format }}
{% endif %}
```

```yaml
last_modified_at: 2026-06-16
```

## Solution

Added a local `post` layout override at `docs/_layouts/post.html` that renders both named labels, `Published date` and `Last modified date`, using `page.date` and `page.last_modified_at`.

Kept `docs/blogs/index.md` and `docs/index.md` showing only the publish date while leaving the existing `{% for post in site.posts %}` ordering unchanged.

Added `last_modified_at` to all existing blog posts, defaulting each value to the same date as that post's published `date`.

Updated `rules.md` with the manual editing convention: `date` is the published date, `last_modified_at` is the manually updated last modified date, and new posts can start with both values the same.

## Files Changed

* `docs/_layouts/post.html`
* `docs/blogs/index.md`
* `docs/index.md`
* `docs/blogs/_posts/*.md`
* `rules.md`
* `logs/2026/06-Jun.md`
* `logs/2026/conversations/2026-06-16_blog_last_modified_dates.md`

## Final Result

All blog posts now have last modified metadata. Existing posts default to the published date, individual blog pages display `Published date` and `Last modified date`, and blog index pages display only the publish date and keep publish-date sorting.
