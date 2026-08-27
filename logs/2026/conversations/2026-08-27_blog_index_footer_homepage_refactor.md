# Blog Index, Footer, and Homepage Refactor

Date: 2026-08-27

## Problem

The blog listing logic was duplicated inline on both the homepage (`docs/index.md`) and the blogs index (`docs/blogs/index.md`), making it hard to keep the two views consistent. The RSS button styling was also inlined as inline styles/JS, and the footer was missing contact links.

## Discussion

- Created a shared `docs/_includes/post-list.html` include to render post lists (date, title, `external_url` awareness with a ↗ marker, and a short excerpt). It supports an optional `limit` for the homepage "Recent posts".
- Refactored `docs/blogs/index.md` to group posts by publish year (newest first) via `site.posts | group_by_exp` and to render each group with the shared include.
- Moved the RSS "Subscribe via RSS" button's inline styles into a reusable `.rss-btn` class in `docs/assets/main.scss` (including hover/focus states) and referenced it from `blogs/index.md`.
- Updated `docs/_includes/footer.html` to add Email and LinkedIn links alongside GitHub, and reduced the font size to 16px.
- Updated the homepage (`docs/index.md`) to reuse the shared `post-list.html`, refine the intro, reorder the Data Engineering Projects section, and move projects above Professional Experience.

## Code / Commands

```liquid
{%- comment -%}
  Shared post-list markup, reused by the homepage (index.md) and blogs/index.md.
  Usage:
    {% include post-list.html posts=site.posts limit=5 %}
    {% include post-list.html posts=year.items %}
{%- endcomment -%}
{%- assign _posts = include.posts | default: site.posts -%}
{%- if include.limit -%}
  {%- assign _posts = _posts | limit: include.limit -%}
{%- endif -%}
<ul style="list-style: none; padding-left: 0;">
  {%- for post in _posts -%}
  <li style="margin-bottom: 1.25em;">
    <div style="color: #888;">{{ post.date | date: "%b %-d, %Y" }}</div>
    <a href="{{ post.external_url | default: post.url }}"
       style="font-size: 1.1em; font-weight: 600; text-decoration: none; color: #007acc;">
      {{ post.title }}{% if post.external_url %} ↗{% endif %}
    </a>
    <div style="color: #888; margin-top: 0.25em;">{{ post.description | default: post.excerpt | strip_html | truncatewords: 25 }}</div>
  </li>
  {%- endfor -%}
</ul>
```

## Solution

Centralized blog list rendering into the `post-list.html` include to keep the homepage and blog index consistent, moved RSS button styling into CSS, and expanded footer contact links.

## Files Changed

* `docs/_includes/post-list.html` (new)
* `docs/_includes/footer.html`
* `docs/assets/main.scss`
* `docs/blogs/index.md`
* `docs/index.md`

## Final Result

The blog index groups posts by year, the homepage and blog index share one post-list component, RSS styling is reusable via a CSS class, and the footer now includes Email/LinkedIn/GitHub links.
