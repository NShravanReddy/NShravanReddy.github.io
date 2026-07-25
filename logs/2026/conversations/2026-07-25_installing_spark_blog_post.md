# Installing Spark Blog Post

Date: 2026-07-25

## Problem

An exported Notion blog post about "Installing Spark" existed as a raw markdown file with broken image paths in an `ExportBlock-*` folder. The task was to convert it into a properly formatted Jekyll post for GitPages deployment, organize the images, and add a table of contents.

## Discussion

- The exported markdown had images referenced with relative paths like `Installing Spark/image.png` which would break on GitHub Pages
- The `docs/blogs/images/` folder already had files named `image.png` through `image 5.png`, so direct copying would cause conflicts
- Images were renamed with a unique `spark_install_` prefix to avoid overwriting existing files
- TIFF images were kept as `.png` extensions for web compatibility
- Added a Table of Contents with anchor links (Notion-style) after the main title
- Fixed numbering inconsistencies in the macOS steps
- Added proper Jekyll frontmatter and the date line

## Code / Commands

```bash
# Copy images with unique names
cp image.png spark_install_1.png
cp "image 1.png" spark_install_2.png
...
cp 2026-07-24_16-27-49.tiff spark_install_java_env.png

# Remove export folder
rm -rf ExportBlock-*

# Rename file to match publish date
mv 2026-07-24-installing-spark.md 2026-07-25-installing-spark.md
```

## Files Changed

* `docs/blogs/_posts/2026-07-25-installing-spark.md` — Created new Jekyll blog post
* `docs/blogs/images/spark_install_1.png` — New image
* `docs/blogs/images/spark_install_2.png` — New image
* `docs/blogs/images/spark_install_3.png` — New image
* `docs/blogs/images/spark_install_4.png` — New image
* `docs/blogs/images/spark_install_5.png` — New image
* `docs/blogs/images/spark_install_6.png` — New image
* `docs/blogs/images/spark_install_java_env.png` — New image
* `docs/blogs/images/spark_install_java_version.png` — New image
* `docs/blogs/_posts/ExportBlock-26e5ee3d-fecc-48fa-a79d-d2a4aafd7bac-Part-1/` — Removed export folder

## Final Result

Successfully created a fully formatted Jekyll blog post "Installing Spark" with proper frontmatter, Table of Contents, 8 images in the standard images directory, and consistent image paths. The post is ready for GitPages deployment at `/blogs/2026/07/25/installing-spark/`.