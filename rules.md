


# blogs location

1. Ask user for blog title, link, and date
2. Add entry to docs/blogs/index.md (HTML list format, newest first)
3. Add entry to docs/index.md under ## Blog Posts (markdown list format, newest first)

Example (docs/index.md):
- [(Kimball's) Dimensional Modelling](https://nsr6.notion.site/36205b97e27e808db853dfaf8f9ec989?v=36a05b97e27e8007bf25000c39a9337a) - May 24, 2026

# logs
if files are not present only create files

go to .github/instructions.md 


# commit message should be 

todays date in format

YYYY-MM-DD_change_that_we_did

# workflow (order of operations)

1. FIRST — make code changes (edit files, add features, fix bugs, etc.)
2. SECOND — commit the code changes with message format:
   YYYY-MM-DD_change_description
   Example: 2026-05-24_added_dimensional_modelling_blog_entry

3. THIRD — update logs:
   - Create/update conversation note in logs/YEAR/conversations/
   - Create/update monthly log in logs/YEAR/MM-Month.md
   - Follow .github/instructions.md for exact log format

4. FOURTH — commit the log files with message format:
   YYYY-MM-DD_logs_description
   Example: 2026-05-24_logs_blogs_index_update
