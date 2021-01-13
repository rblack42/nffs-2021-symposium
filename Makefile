.PHONY: venv
venv:
	python3 -m venv _venv && \
		source _venv/bin/activate && \
		pip install --upgrade pip

.PHONY: reqs
reqs:
	source _venv/bin/activate && \
		pip install -r requirements.txt

.PHONY: docs
docs:
	cd rst && \
		sphinx-build -b html -d _build/doctrees . ../docs

.PHONY: tex
tex:
	cd tex && \
	pdflatex main && \
	bibtex main && \
	pdflatex main

