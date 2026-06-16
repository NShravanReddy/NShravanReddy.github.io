---
layout: null
---

# Local Jekyll Blog Setup Guide

This guide documents the exact steps to set up and run this Jekyll blog (powered by GitHub Pages + minima theme) on a macOS machine.

---

## Prerequisites

- macOS (Apple Silicon or Intel)
- [Homebrew](https://brew.sh/) installed
- Git installed
- Internet connection (for downloading gems)

---

## Step 1: Install rbenv & ruby-build

rbenv manages Ruby versions per-project (like Python's `pyenv` or Node's `nvm`).

```bash
brew update
brew install rbenv ruby-build
```

**Add rbenv to your shell** (add this to `~/.zshrc` or `~/.bash_profile`):

```bash
echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc
source ~/.zshrc
```

Verify it's working:

```bash
rbenv --version
```

---

## Step 2: Install Ruby 3.2.2

This project uses Ruby 3.2.2 (required by Jekyll 4.4).

```bash
# Install Ruby (compiles from source — takes 3-5 minutes)
rbenv install 3.2.2

# Set Ruby 3.2.2 as the local version for this project
cd /path/to/NShravanReddy.github.io
rbenv local 3.2.2

# Verify
ruby --version
# Should output: ruby 3.2.2 (2023-03-30 revision e51014f9c0) [arm64-darwinXX]
```

---

## Step 3: Install Bundler

Bundler manages Ruby gem dependencies (like Python's `pip` + `venv`).

```bash
gem install bundler
bundler --version   # Should show version 2.4.x
```

---

## Step 4: Install Jekyll & Dependencies

Navigate to the `docs/` directory (where the `Gemfile` lives) and install all gems:

```bash
cd docs
bundle install
```

This installs:
- **Jekyll 4.4.1** — the static site generator
- **Minima 2.5.2** — the theme
- **jekyll-feed** — RSS feed plugin
- **jekyll-sitemap** — sitemap generation
- **webrick** — local web server (required on Ruby 3.1+)
- **+35 other dependencies** (kramdown, liquid, sass, etc.)

---

## Step 5: Serve Locally

```bash
cd docs
bundle exec jekyll serve
```

You'll see output like:

```
Server address: http://127.0.0.1:4000/
Server running... press ctrl-c to stop.
```

**Open in browser:**

| URL | Content |
|---|---|
| `http://localhost:4000` | Main portfolio site |
| `http://localhost:4000/blogs` | Blog index with all posts |

### Live Reload (optional)

Add `--livereload` to auto-refresh the browser on file changes:

```bash
bundle exec jekyll serve --livereload
```

---

## Step 6: Build Only (no server)

If you just want to generate the static files without serving:

```bash
cd docs
bundle exec jekyll build
```

Output goes to `docs/_site/`.

---

## Using the Makefile

A `Makefile` is provided at the project root for convenience:

| Command | Description |
|---|---|
| `make setup` | Run all setup steps (rbenv + Ruby + gems) |
| `make serve` | Start Jekyll server with livereload |
| `make build` | Build site only |
| `make clean` | Remove `_site/`, `.bundle/`, `Gemfile.lock` |

```bash
# Example: first-time setup on a new machine
make setup

# Start developing
make serve
```

---

## Project Structure

```
NShravanReddy.github.io/
├── Makefile              # Convenience commands
├── .ruby-version         # Sets Ruby 3.2.2 for this project
├── docs/
│   ├── _config.yml       # Main site config (with Google Analytics)
│   ├── Gemfile           # Ruby dependencies
│   ├── Gemfile.lock      # Locked dependency versions
│   ├── index.md          # Main portfolio homepage
│   ├── _layouts/         # Custom layout overrides
│   │   └── post.html     # Blog post layout (shows published and last modified dates)
│   ├── _site/            # Generated output (gitignored)
│   └── blogs/
│       ├── index.md      # Blog homepage
│       └── _posts/       # Blog posts (Markdown + frontmatter)
```

---

## Adding Google Analytics

The site uses one Jekyll config for both local development and GitHub Pages:

```text
docs/_config.yml
```

That config has:

```yaml
google_analytics: G-JLPX0QK3WW
```

Minima theme automatically injects the GA tracking code into `<head>` of every page when this is set. No manual code needed.

---

## Adding Custom Features

### "Last Modified" on Blog Posts

Add to any post's frontmatter:

```yaml
---
layout: post
title: "My Post"
date: 2024-01-01
last_modified_at: 2026-06-16
tags: [tag1, tag2]
---
```

The custom `docs/_layouts/post.html` displays `Published date` and `Last modified date` inside every blog post.

---

## Troubleshooting

| Issue | Fix |
|---|---|
| `ruby` command not found after rbenv install | Run `rbenv init` and restart shell |
| `bundle: command not found` | Run `gem install bundler` |
| `jekyll: No such file or directory` | Ensure `rbenv local 3.2.2` is set |
| Port 4000 already in use | `bundle exec jekyll serve --port 4001` |
| Gem installation fails | Try `bundle update` then `bundle install` |
| CSS not loading locally | Access via `http://localhost:4000` not `file://` |

---

## Resetting Everything

If you want to start fresh:

```bash
# Remove all generated files
make clean

# Remove Ruby version
rm .ruby-version

# Remove rbenv (if needed)
brew uninstall rbenv ruby-build
