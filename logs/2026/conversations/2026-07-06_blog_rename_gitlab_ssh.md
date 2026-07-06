# Blog rename and front matter update — GitLab SSH blog post

Date: 2026-07-06

## Problem

The blog post "Accessing a GitLab Repository Locally in VS Code Using SSH" had a raw GitHub-generated filename with a UUID (`U 38605b97e27e8077bcf4f5165cbe65b8`) instead of the standard `YYYY-MM-DD-slug.md` naming convention used by all other posts. It also lacked required Jekyll front matter.

## Discussion

- The file needed to be renamed to match the `YYYY-MM-DD-slug.md` format
- Jekyll front matter (`layout`, `title`, `date`, `description`, `last_modified_at`, `tags`) was missing — the post would not be recognized by Jekyll
- Blog date was specified as July 5, 2026
- `docs/index.md` and `docs/blogs/index.md` both use `site.posts` auto-listing, so no manual edits were needed there

## Code / Commands

```bash
mv "docs/blogs/_posts/Accessing a GitLab Repository Locally in VS Code U 38605b97e27e8077bcf4f5165cbe65b8.md" "docs/blogs/_posts/2026-07-05-accessing-gitlab-repository-locally-in-vs-code.md"
```

## Solution

1. Renamed file to `2026-07-05-accessing-gitlab-repository-locally-in-vs-code.md`
2. Added Jekyll front matter:
   - `layout: post`
   - `title: "Accessing a GitLab Repository Locally in VS Code Using SSH"`
   - `date: 2026-07-05`
   - `description: "Step-by-step guide to set up SSH keys for GitLab and clone repositories locally in VS Code."`
   - `last_modified_at: 2026-07-05`
   - `tags: [GitLab, SSH, VS Code, DevOps]`

## Files Changed

* `docs/blogs/_posts/2026-07-05-accessing-gitlab-repository-locally-in-vs-code.md` (renamed + front matter added)

## Final Result

The blog post now follows the standard naming convention and has proper Jekyll front matter, making it visible in both the homepage's "Latest Blog Posts" section and the full blogs index.