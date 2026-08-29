# ==============================================================================
#  latexmkrc — تنظیمات latexmk برای این قالب
#
#  کاربرد:   latexmk            (یک بار ساخت)
#            latexmk -pvc       (ساخت پیوسته، با هر ذخیره)
#            latexmk -c         (پاک کردن فایل‌های میانی)
#            latexmk -C         (پاک کردن فایل‌های میانی و PDF)
#
#  latexmk خودش تشخیص می‌دهد که چند بار باید اجرا کند تا فهرست مطالب و شمارهٔ کل
#  اسلایدها ثابت شود؛ پس نیازی به اجرای دستی دوباره نیست.
# ==============================================================================

# ---- موتور: XeLaTeX ---------------------------------------------------------
# $pdf_mode = 5  یعنی «pdf را با xelatex بساز».  این قالب با pdflatex کار نمی‌کند.
$pdf_mode  = 5;
$dvi_mode  = 0;
$postscript_mode = 0;

$xelatex = 'xelatex -interaction=nonstopmode -halt-on-error -file-line-error '
         . '-synctex=1 %O %S';

# ---- فایل پیش‌فرض -----------------------------------------------------------
@default_files = ('main.tex');

# ---- مسیر جست‌وجوی فایل‌های ورودی -------------------------------------------
# هم‌ارز \input@path در main.tex، برای وقتی که latexmk را از پوشهٔ دیگری صدا
# می‌زنید.  «//» یعنی زیرپوشه‌ها را هم بگرد.
ensure_path('TEXINPUTS', './', './theme//', './config//', './content//',
                         './universities//');
ensure_path('TEXFONTS',  './fonts//');

# ---- اگر روزی biblatex + biber را به کار بردید ------------------------------
$bibtex_use = 2;          # مدخل‌ها را از .bib بردار و .bbl را هم در clean پاک کن
$biber      = 'biber --validate-datamodel %O %S';

# ---- پسوندهایی که beamer و xepersian می‌سازند و در clean باید پاک شوند ------
$clean_ext .= ' nav snm vrb xdv synctex.gz run.xml bbl bcf fls fdb_latexmk';

# ---- نمایشگر PDF -----------------------------------------------------------
# در حالت -pvc، فایل PDF را با نمایشگر پیش‌فرض سیستم باز می‌کند.
$pdf_previewer = 'start %O %S';
