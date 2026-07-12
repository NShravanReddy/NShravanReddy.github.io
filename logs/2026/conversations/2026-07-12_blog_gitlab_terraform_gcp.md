# Blog: GitLab CI/CD with Terraform on Google Cloud Using Workload Identity Federation

Date: 2026-07-12

## Problem

Raw blog post file existed with malformed filename (`GitLab CI CD with Terraform on Google Cloud Using  39405b97e27e80d89368f70c58c15267.md`) and images were in a subdirectory with spaces. Needed to create a properly named Jekyll blog post, move images to `docs/blogs/images/`, and fix image paths.

## Discussion

- Created properly named file: `2026-07-12-gitlab-ci-cd-terraform-gcp-workload-identity-federation.md`
- Moved 17 images from the old subdirectory to `docs/blogs/images/`
- Deduplicated the `.gitlab-ci.yml` block that appeared twice in the content
- Fixed image paths from relative `../images/` to absolute `/blogs/images/` to match other blog posts
- Deleted old malformed files and directory

## Files Changed

- `docs/blogs/_posts/2026-07-12-gitlab-ci-cd-terraform-gcp-workload-identity-federation.md` (created)
- `docs/blogs/images/` (17 images moved here)
- `docs/blogs/_posts/GitLab CI CD with Terraform on Google Cloud Using  39405b97e27e80d89368f70c58c15267.md` (deleted)
- `docs/blogs/_posts/GitLab CI CD with Terraform on Google Cloud Using /` (deleted)

## Final Result

Blog post created with proper Jekyll front matter, deduplicated content, and correct absolute image paths pointing to `/blogs/images/`.