# wreillo.github.io

Personal website, built with [Quarto](https://quarto.org) and deployed to GitHub Pages.

🔗 Live site: [www.wreillo.com](https://www.wreillo.com)

## Stack

- **Quarto** (1.9.x) — site generation
- **R** + [renv](https://rstudio.github.io/renv/) — package management for R-based posts (leaflet, DT widgets, etc.)
- **GitHub Actions** — renders and deploys on every push to `main`
- **[Positron](https://positron.posit.co/)** — recommended editor for authoring content locally

## Project structure

```
.
├── index.qmd          # Homepage (native Quarto "about" page)
├── posts.qmd          # Posts listing page
├── posts/
│   ├── _metadata.yml  # Shared post options (freeze, toc, author)
│   ├── _template/     # Scaffold used by new-post.sh
│   └── <slug>/
│       └── index.qmd  # One folder per post
├── _quarto.yml        # Site config (nav, theme, footer)
├── renv.lock          # Locked R package versions
└── .github/workflows/build-website.yaml  # CI: render + deploy to gh-pages
```

## Local development

```bash
git clone https://github.com/wreillo/wreillo.github.io.git
cd wreillo.github.io
```

Open the folder in Positron (or RStudio/VS Code). Restore the R environment:

```r
renv::restore()
```

Then preview with live reload:

```bash
quarto preview
```

## Adding a new post

```bash
./new-post.sh my-new-post-slug
```

This copies `posts/_template/index.qmd` into `posts/my-new-post-slug/`. Edit the front matter (`title`, `date`, `categories`, `image`) and write the post — it'll show up in the Posts listing automatically once pushed.

## Deployment

Pushing to `main` triggers `.github/workflows/build-website.yaml`, which runs `quarto render` and deploys the `_site` output to the `gh-pages` branch. GitHub Pages serves from there. No manual build or push of rendered HTML is needed.
