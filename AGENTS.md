# Repository Guidelines

## Project Structure & Module Organization
- `resume.tex` is the single entry point; include shared macros there before `\input` directives.
- Section content lives in `resume/*.tex` (e.g., `resume/education.tex`); keep new files lower-case and named for the CV section they own.
- `awesome-cv.cls` tracks Awesome CV overrides; update it only when introducing template-wide styling.
- `fonts/` hosts bundled typefaces, and `references.bib` holds BibTeX entries referenced by `resume/publications.tex`.

## Build, Test, and Development Commands
- `latexmk -xelatex resume.tex` — produce `resume.pdf` with XeLaTeX and incremental recompiles.
- `latexmk -xelatex -interaction=nonstopmode resume.tex` — CI-friendly build that surfaces errors without halting.
- `latexmk -c` — clean intermediate artifacts after verifying the PDF.
- `./compile_cv.sh` — shortcut wrapper around `latexmk -xelatex resume.tex` from the repo root.

## Coding Style & Naming Conventions
- Indent LaTeX environments with two spaces and keep aligned `\begin`/`\end` pairs for readability.
- Favor Awesome CV helpers (`\cvsection`, `\cventrySchool`, `\cvitems`) before defining new macros; document any new helper in `awesome-cv.cls`.
- Keep inline comments (`%`) flush with the code they describe and prefer wrapping text at roughly 90 characters to avoid overlong lines.

## Testing Guidelines
- Run `latexmk -xelatex resume.tex` locally before sending changes; treat warnings as failures and fix them or explain why they persist.
- Visually inspect the regenerated `resume.pdf` for layout regressions (overflow, orphan lines, broken links).
- When updating references, confirm citations resolve by checking the log for `Citation ... undefined` messages.

## Commit & Pull Request Guidelines
- Use imperative, scope-prefixed commit subjects (e.g., `sections: add robotics project summary`) and include context in the body when changes affect multiple files.
- Attach the resulting `resume.pdf` or note the LaTeXmk command output in the PR description so reviewers can compare layouts.
- Reference related issues or TODOs inline (e.g., `Refs #12`) and list any known follow-up tasks in a final “Notes” block.

## Fonts & Reference Assets
- Add new fonts under `fonts/`, update `awesome-cv.cls` font declarations, and verify licensing before committing.
- Expand `references.bib` with stable citation keys (`lastnameYYYYshorttopic`) and keep entries sorted alphabetically for quick lookup.
