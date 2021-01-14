.PHONY: all
all:	tex

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
	python main.sympy && \
	pdflatex main && \
	bibtex main && \
	pdflatex main $$ \
	cp main.pdf ../docs/article.pdf && \
	pandoc main.tex -o ../docs/article.docx

.PHONY: clean
clean:
	cd tex && \
		rm -f *.aux *.bbc *.bbl *.log *.out
