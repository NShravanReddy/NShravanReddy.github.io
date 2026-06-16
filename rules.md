
# rule for git
ask me before commit and pushing to github

# blogs location

1. Ask user for blog title, link, published date, and last modified date
2. Add or update the blog post front matter in `docs/blogs/_posts/`
3. Use `date` for the published date
4. Use `last_modified_at` for the last modified date
5. Usually `date` and `last_modified_at` can be the same when the blog is first published
6. When only updating an old blog, change only `last_modified_at`; do not change `date` unless the published date was wrong
7. Keep blog indexes sorted by published `date`, not `last_modified_at`

Example post front matter:

```yaml
---
layout: post
title: "Blog Title"
date: 2026-06-16
last_modified_at: 2026-06-16
tags: [Data Engineering]
---
```

To manually update a blog later, edit this line only:

```yaml
last_modified_at: 2026-06-16
```

Example (docs/index.md):
- [(Kimball's) Dimensional Modelling](https://nsr6.notion.site/36205b97e27e808db853dfaf8f9ec989?v=36a05b97e27e8007bf25000c39a9337a) - May 24, 2026

# logs
if files are not present only create files

go to .github/instructions.md 


# commit message should be 

todays date in format

YYYY-MM-DD_change_that_we_did

# workflow (order of operations)

1. Make all code changes + update logs (see #logs section for format)
2. Commit everything in one go with format: YYYY-MM-DD_change_description
   Example: 2026-05-24_added_dimensional_modelling_and_updated_rules
