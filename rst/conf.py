# -*- coding: utf-8 -*-
#
# Configuration file for the Sphinx documentation builder.
# -- Path setup --------------------------------------------------------------

import os
import sys
sys.path.insert(0, os.path.abspath('.'))


# -- Project information -----------------------------------------------------

project = u'Math Magik'
copyright = u'2021, Roie R. Black'
author = u'Roie R. Black'

version = u''
release = u'0.5'

# -- General configuration ---------------------------------------------------
extensions = [
    'sphinx.ext.imgmath',
    'sphinx.ext.githubpages',
    'sphinxcontrib.bibtex',
]

bibtex_bibfiles = ['../assets/references.bib']



templates_path = ['_templates']
source_suffix = '.rst'
master_doc = 'index'
language = None
exclude_patterns = [u'_build', 'Thumbs.db', '.DS_Store', '_venv']

pygments_style = None


# -- Options for HTML output -------------------------------------------------

html_theme = 'alabaster'
html_static_path = ['_static']

# -- Options for LaTeX output ------------------------------------------------

latex_elements = {
    'papersize': 'letterpaper',
    'pointsize': '10pt',
    'figure_align': 'htbp',
}

latex_documents = [
    (master_doc, 'MathMagik.tex', u'Math Magik Documentation',
     u'Roie R. Black', 'manual'),
]
