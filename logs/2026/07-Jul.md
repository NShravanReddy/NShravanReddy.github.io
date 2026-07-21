# July 2026

---

## 2026-07-06

### Blog post renamed and front matter added — GitLab SSH Setup

Renamed "Accessing a GitLab Repository Locally in VS Code Using SSH" from its raw filename to the standard `YYYY-MM-DD-slug.md` format with proper Jekyll front matter (title, date, description, tags, last_modified_at).

Related conversation note:

* [2026-07-06_blog_rename_gitlab_ssh](conversations/2026-07-06_blog_rename_gitlab_ssh.md)

---

## 2026-07-12

### Blog post added — GitLab CI/CD with Terraform on GCP

Created a new blog post "GitLab CI/CD with Terraform on Google Cloud Using Workload Identity Federation" with proper Jekyll front matter. Moved 17 images to `docs/blogs/images/`, deduplicated content, and fixed image paths to use absolute `/blogs/images/` URLs.

Related conversation note:

* [2026-07-12_blog_gitlab_terraform_gcp](conversations/2026-07-12_blog_gitlab_terraform_gcp.md)

---

## 2026-07-18

### RSS feed fixed to show all blog posts

Created `docs/feed.xml` to override jekyll-feed's default 10-post limit. GitHub Pages builds with Jekyll 3.10.0 (not 4.4 as in Gemfile), and the older jekyll-feed gem had a default `limit: 10` in its embedded template. The custom feed template iterates over all `site.posts` without a limit.

Related conversation note:

* [2026-07-18_rss_feed_fix](conversations/2026-07-18_rss_feed_fix.md)

---

## 2026-07-21

### UV blog post — code formatting and link fixes

Formatted code blocks with proper markdown (```) in the UV blog post, fixed broken activate path (`/bin/activate` → `satvick/bin/activate`), added section headers, and converted plain text URLs to proper markdown links.

Related conversation note:

* [2026-07-21_uv_blog_code_formatting](conversations/2026-07-21_uv_blog_code_formatting.md)
