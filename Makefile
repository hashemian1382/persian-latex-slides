# ==============================================================================
#  Makefile — قالب اسلایدهای ارائهٔ دفاع پایان‌نامه
#
#  make            ساخت main.pdf
#  make example    ساخت example-minimal.pdf
#  make all        هر دو
#  make watch      ساخت پیوسته با latexmk (اگر نصب باشد)
#  make clean      پاک کردن فایل‌های میانی
#  make distclean  پاک کردن فایل‌های میانی و PDFها
#  make help       همین فهرست
#
#  توجه: موتور xelatex است، نه pdflatex.
# ==============================================================================

MAIN    := main
EXAMPLE := example-minimal
ENGINE  := xelatex
FLAGS   := -interaction=nonstopmode -halt-on-error -file-line-error

# پسوندهای میانی که xelatex و beamer می‌سازند
AUXEXT  := aux log nav out snm toc vrb bbl blg bcf run.xml fls fdb_latexmk \
           synctex.gz xdv

SOURCES := $(MAIN).tex \
           $(wildcard config/*.tex) \
           $(wildcard content/*.tex) \
           $(wildcard universities/*.tex) \
           $(wildcard theme/*.sty)

.PHONY: all main example watch clean distclean help
.DEFAULT_GOAL := main

main: $(MAIN).pdf

all: $(MAIN).pdf $(EXAMPLE).pdf

# دو بار اجرا لازم است: بار اول فهرست مطالب و شمارهٔ کل اسلایدها را در .aux
# می‌نویسد و بار دوم آن‌ها را به کار می‌برد.
$(MAIN).pdf: $(SOURCES)
	$(ENGINE) $(FLAGS) $(MAIN).tex
	$(ENGINE) $(FLAGS) $(MAIN).tex

example: $(EXAMPLE).pdf

$(EXAMPLE).pdf: $(EXAMPLE).tex $(wildcard theme/*.sty) config/fonts.tex
	$(ENGINE) $(FLAGS) $(EXAMPLE).tex
	$(ENGINE) $(FLAGS) $(EXAMPLE).tex

watch:
	latexmk -pvc $(MAIN).tex

clean:
	@for e in $(AUXEXT); do rm -f $(MAIN).$$e $(EXAMPLE).$$e; done
	@echo "فایل‌های میانی پاک شدند."

distclean: clean
	rm -f $(MAIN).pdf $(EXAMPLE).pdf
	@echo "PDFها هم پاک شدند."

help:
	@echo "make            ساخت $(MAIN).pdf"
	@echo "make example    ساخت $(EXAMPLE).pdf"
	@echo "make all        هر دو"
	@echo "make watch      ساخت پیوسته با latexmk"
	@echo "make clean      پاک کردن فایل‌های میانی"
	@echo "make distclean  پاک کردن فایل‌های میانی و PDFها"
