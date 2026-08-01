# Website Footer and Width Fix

Date: 2026-08-01

## Problem

1. Footer text was hard-coded in multiple page files (`docs/index.md`, `docs/blogs/index.md`) with inconsistent name versions ("Shravan Reddy", "Shravan Reddy Nadiveedi").
2. Content was constrained to a narrow centered column (~740px) by the minima theme's default `.wrapper` max-width, leaving lots of empty space on wide screens.

## Discussion

- Jekyll theme files (minima) live inside the installed gem, not the repo. Editing gem files directly breaks deployment to GitHub Pages and gets overwritten on reinstall.
- The correct Jekyll customization pattern is the override: create a file with the same name in the repo's `_includes/` or `assets/` folder to replace the theme's version.
- Used `docs/_includes/footer.html` to override minima's footer with copyright + GitHub link.
- Used `docs/assets/main.scss` to override the theme's `.wrapper` max-width.

## Code / Commands

```scss
---
---
@import "minima";

.wrapper {
  max-width: calc(1200px - (30px * 2));
  margin-right: auto;
  margin-left: auto;
  padding-right: 30px;
  padding-left: 30px;
}
```

```html
<footer class="site-footer">
  <div class="wrapper">
    <div style="text-align: center; padding: 20px; margin-top: 40px;">
      <p>&copy; 2025 Shravan Reddy Nadiveedi</p>
      <div style="margin-top: 10px;">
        <a href="https://github.com/NShravanReddy" style="margin: 0 10px; text-decoration: none; color: #333; font-size: 24px;">Github</a>
      </div>
    </div>
  </div>
</footer>
```

## Solution

- Created `docs/_includes/footer.html` — overrides minima theme footer, applied automatically to all pages.
- Created `docs/assets/main.scss` — overrides `.wrapper` max-width to ~1140px.
- Removed hard-coded `<footer>` blocks from `docs/index.md` and `docs/blogs/index.md`.
- Updated `docs/_config.yml` title to "Shravan Reddy Nadiveedi" (done by user).
- Ran `make build` successfully; generated CSS confirms `.wrapper { max-width: 1140px; }`.

## Files Changed

* docs/_includes/footer.html (new)
* docs/assets/main.scss (new)
* docs/index.md
* docs/blogs/index.md
* docs/_config.yml

## Final Result

Site now has a single shared footer (copyright + GitHub) applied to all pages, and content spans ~1140px instead of a narrow ~740px middle column.