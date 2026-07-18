# RSS Feed Fix - Custom feed.xml to Include All Blog Posts

Date: 2026-07-18

## Problem

RSS feed at `https://nshravanreddy.github.io/feed.xml` only showed 10 blog posts instead of all 32. The blog listing page correctly showed all posts.

## Discussion

- Verified production feed has only 10 `<entry>` elements vs 25+ posts on the blog page
- GitHub Pages builds with Jekyll 3.10.0 (not 4.4 as in Gemfile)
- The older jekyll-feed gem on GitHub Pages has a default `limit: 10` in its embedded template
- `site.posts` correctly contains all posts (verified from blog listing)
- No custom feed template existed — the plugin's default was being used

## Solution

Created `docs/feed.xml` — a custom feed template that overrides the plugin's default and iterates over **all** `site.posts` without a limit.

## Files Changed

* `docs/feed.xml` (new file)

## Final Result

Production feed now shows 32 entries (all blog posts). New posts will be automatically included since the template uses `{% for post in site.posts %}`.