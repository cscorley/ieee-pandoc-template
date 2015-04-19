# ieee-pandoc-template

hi, [welcome to heck](https://youtu.be/Im6A_eTF01s?t=745)

todo:

## usage

### metadata

You'll want to change `metadata.yaml` to reflect things about your paper, such
as authors and the title.

### editing

Put all markdown files into `sections/`. I suggest naming them in a sortable
order, e.g., `01_intro.md`, `02_background.md`, etc. Make sure to include
something like `sections/other.md` as the last file to get a References
section.

### compiling the pdf

Just run `make`. Or look at `Makefile` and draw your own conclusions.

### customizing

If you have some extra packages or LaTeX you want to define, throw it into
`custom.latex`. It'll be inserted before the document environment begins.

### arxiv uploading

You can upload directly to arxiv after compiling. upload the `paper.tex` and
`paper.bbl` files along with any figures. I set `graphicspath` in
`template.latex` to make the figures folder work on arxiv without needing to
edit stuff, but you can put them wherever suits you in `custom.latex`.

## contributing

1. Fork
2. Edits on a feature branch
3. Pull request
