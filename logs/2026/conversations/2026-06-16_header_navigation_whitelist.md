# Header Navigation Whitelist

Date: 2026-06-16

## Problem

Extra links such as "Downloading the llm model from hf" and "Local Jekyll Blog Setup Guide" were appearing in the header on blog pages.

## Discussion

The site uses the Minima Jekyll theme. Minima can automatically include discovered pages in the header navigation, so standalone markdown files under `docs/` and nested blog reference pages were being shown as navigation links.

## Code / Commands

```yaml
header_pages:
  - index.md
  - blogs/index.md
```

## Solution

Added `header_pages` to `docs/_config.yml` to whitelist only the Home and Blog pages in the header.

## Files Changed

* `docs/_config.yml`
* `logs/2026/06-Jun.md`
* `logs/2026/conversations/2026-06-16_header_navigation_whitelist.md`

## Final Result

The header navigation is configured to show only Home and Blog, preventing setup and reference markdown pages from appearing globally.
