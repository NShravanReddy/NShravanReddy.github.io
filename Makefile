.PHONY: setup serve build clean help

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "Targets:"
	@echo "  setup   Install rbenv, Ruby 3.2.2, bundler, and all Jekyll gems"
	@echo "  serve   Start Jekyll local server at http://localhost:4000"
	@echo "  build   Build the site into docs/_site without serving"
	@echo "  clean   Remove generated files (_site, .bundle, Gemfile.lock)"

setup:
	@echo "==> Installing rbenv and ruby-build..."
	brew install rbenv ruby-build
	@echo "==> Installing Ruby 3.2.2 (this may take a few minutes)..."
	rbenv install 3.2.2
	@echo "==> Setting local Ruby version..."
	rbenv local 3.2.2
	@echo "==> Installing bundler..."
	gem install bundler
	@echo "==> Installing Jekyll and dependencies..."
	export PATH="$$HOME/.rbenv/bin:$$HOME/.rbenv/shims:$$PATH" && cd docs && bundle install
	@echo ""
	@echo "✓ Setup complete! Run 'make serve' to start the local server."

serve:
	@echo "==> Starting Jekyll server at http://localhost:4000..."
	@echo "    Blog at http://localhost:4000/blogs"
	export PATH="$$HOME/.rbenv/bin:$$HOME/.rbenv/shims:$$PATH" && cd docs && bundle exec jekyll serve --livereload

build:
	@echo "==> Building site into docs/_site..."
	export PATH="$$HOME/.rbenv/bin:$$HOME/.rbenv/shims:$$PATH" && cd docs && bundle exec jekyll build
	@echo "✓ Build complete. Output in docs/_site/"

clean:
	@echo "==> Removing generated files..."
	rm -rf docs/_site docs/.bundle docs/Gemfile.lock
	@echo "✓ Cleaned."