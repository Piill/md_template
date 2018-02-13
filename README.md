# Markdown template

This is a template for writing assignments and reports in markdown, using pandoc and latex.
Included is a generic template and a DTU specefic template, but you can use your own.

To switch between templates, simply change the template variable in the makefile

To generate the pdf, simple run `make`

Support for bibtex is done using pandoc-citeproc

## Install requirements

On any apt based system, the following should be enough to get you going:
````
sudo apt install pandoc pandoc-citeproc texlive texlive-luatex
````

Other systems are left as an exercise for the reader.

