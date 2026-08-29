<div dir="rtl">

# قالب اسلایدهای ارائهٔ دفاع پایان‌نامه — PersianThesis

قالبی فارسی، مدولار و آمادهٔ استفاده برای اسلایدهای دفاع پایان‌نامهٔ **کارشناسی** و
**کارشناسی ارشد**، بر پایهٔ `beamer` + `xepersian` و با فونت **وزیرمتن**.

* راست‌به‌چپِ درست: نوار پیشرفت، خط زیر عنوان و نوار رنگیِ جعبه‌ها همه از **راست**
  آغاز می‌شوند.
* رقم‌های فارسی به‌طور خودکار (شمارهٔ اسلاید، شمارهٔ فصل، فهرست مطالب) و رقم‌های
  انگلیسی درون `\en{...}`.
* هفت طرح‌رنگ آماده و پیش‌تنظیم چند دانشگاه؛ رنگ سازمانی هر دانشگاه دیگری هم با
  سه عدد `HTML` تنظیم می‌شود.
* بدون نیاز به هیچ فایل تصویری: اگر لوگو نگذارید، یک نشان برداریِ بی‌طرف کشیده
  می‌شود.

---

## پیش‌نیازها

* یک توزیع تک‌لایو ۲۰۲۱ یا جدیدتر (یا MiKTeX / MacTeX معادل)
* موتور **XeLaTeX** — با `pdflatex` کامپایل نمی‌شود
* بسته‌ها: `beamer`, `xepersian`, `bidi`, `fontspec`, `tikz/pgf`, `tcolorbox`,
  `listings`, `etoolbox`, `booktabs`, `amsmath` — همه در نصب کامل تک‌لایو موجودند.

فونت‌ها همراه پروژه‌اند (`fonts/Vazirmatn/`) و **نیازی به نصب در سیستم ندارند**؛
با مسیر بار می‌شوند.

## کامپایل

```bash
xelatex main.tex && xelatex main.tex
```

دو بار لازم است تا فهرست مطالب و «۷ از ۱۸» درست شود. یا:

```bash
latexmk main.tex
```

```bash
make
```

---

## از کجا شروع کنم؟

۱. فایل `config/info.tex` را باز کنید و نام دانشگاه، عنوان، استادان و تاریخ را
   بنویسید. **در حالت معمولی همین یک فایل کافی است.**
۲. اگر دانشگاه‌تان پیش‌تنظیم دارد، در `main.tex` سطر
   `\input{universities/sharif.tex}` را با آن عوض کنید.
۳. محتوای اسلایدها را در `content/*.tex` بنویسید.
۴. لوگو را در `figures/logos/` بگذارید و نامش را در `config/info.tex` یا در
   پیش‌تنظیم دانشگاه بدهید.

## ساختار پروژه

```
main.tex                  چیدمان کلی و ترتیب فصل‌ها
example-minimal.tex       کمینه‌ترین شکل استفاده، برای ارائه‌های کوتاه

config/
  packages.tex            بسته‌های عمومی
  info.tex              ★ مشخصات دفاع — تنها فایلی که معمولاً ویرایش می‌شود
  fonts.tex               فونت‌ها و xepersian (همیشه آخرین ورودی پیش‌درآمد)

theme/
  beamerthemePersianThesis.sty         قالب اصلی و کلیدهای \PTsetup
  beamercolorthemePersianThesis.sty    طرح‌رنگ‌ها
  beamerfontthemePersianThesis.sty     اندازه و وزن قلم‌ها
  beamerinnerthemePersianThesis.sty    جلد، جداکنندهٔ فصل، فهرست، نشانهٔ بندها
  beamerouterthemePersianThesis.sty    عنوان اسلاید، پانویس، نوار پیشرفت
  persian-thesis-utils.sty             ابزارهای پایه و متادیتا
  persian-thesis-boxes.sty             جعبه‌های رنگی، محیط کد، سبک‌های TikZ

universities/             پیش‌تنظیم رنگ و لوگوی دانشگاه‌ها
content/                  محتوای اسلایدها، هر فصل یک فایل
figures/, refs/, fonts/   تصاویر، منابع، فونت‌ها
```

### ترتیب پیش‌درآمد — مهم

`xepersian` باید **آخرین** بستهٔ پیش‌درآمد باشد. به همین دلیل
`config/fonts.tex` همیشه در پایان و بلافاصله پیش از `\begin{document}` می‌آید.
اگر بستهٔ تازه‌ای می‌افزایید، آن را **پیش از** این سطر بگذارید.

---

## تنظیم قالب: `\PTsetup`

هر کلید را می‌توان هم در گزینه‌های `\usetheme[...]{PersianThesis}` داد و هم بعداً
با `\PTsetup{...}`:

| کلید | مقدارها | پیش‌فرض | کار |
|---|---|---|---|
| `palette` | `indigo` `navy` `teal` `maroon` `forest` `plum` `graphite` | `indigo` | طرح‌رنگ |
| `mode` | `light` `dark` | `light` | زمینهٔ روشن یا تیره |
| `primary` | شش‌رقمی `HTML` | — | جای‌گزینی رنگ اصلی |
| `secondary` | شش‌رقمی `HTML` | — | جای‌گزینی رنگ دوم |
| `accent` | شش‌رقمی `HTML` | — | جای‌گزینی رنگ تأکید |
| `progressbar` | `none` `foot` `head` `both` | `foot` | جای نوار پیشرفت |
| `numbering` | `fraction` `plain` `none` | `fraction` | «۷ از ۱۸» یا «۷» یا هیچ |
| `footline` | `true` `false` | `true` | پانویس متنی |
| `eyebrow` | `true` `false` | `true` | سطر «فصل ۲ : ...» بالای عنوان |
| `sectionpage` | `true` `false` | `true` | اسلاید جداکنندهٔ ابتدای فصل |
| `tocnumbers` | `true` `false` | `true` | شمارهٔ فصل در فهرست مطالب |
| `margin` | طول | `1.05cm` | حاشیهٔ چپ و راست متن |
| `logo` | مسیر فایل | — | لوگوی اصلی جلد |
| `secondlogo` | مسیر فایل | — | لوگوی دوم (پژوهشکده، آزمایشگاه…) |

`primary`/`secondary`/`accent` بر `palette` مقدم‌اند، به هر ترتیبی که نوشته شوند.

### دانشگاه دیگری دارید؟

یک فایل تازه در `universities/` بسازید:

```latex
\PTsetup{
  primary   = 1C3F72,     % رنگ اصلی نشان دانشگاه
  secondary = 33639E,
  accent    = C08A2E,
  logo      = figures/logos/my-university.pdf,
}
\university{نام کامل دانشگاه}
\shortuniversity{نام کوتاه برای پانویس}
\faculty{دانشکدهٔ ...}
```

و در `main.tex` آن را **پیش از** `\input{config/info.tex}` بار کنید.

---

## چه چیزهایی در اسلایدها آماده است؟

### قاب‌های آماده

| فرمان | کار |
|---|---|
| `\PTtitleframe` | جلد |
| `\PToutlineframe[...]` | فهرست مطالب (پیش‌فرض: بدون زیربخش) |
| `\PTclosingframe` | اسلاید تشکر و پرسش |

### جعبه‌ها

همه یک آرگومان اختیاری دارند که به عنوان جعبه افزوده می‌شود:
`\begin{PTdef}[RAG]` ← «تعریف: RAG».

| محیط | عنوان | رنگ |
|---|---|---|
| `PTdef` | تعریف | اصلی |
| `PTthm` | قضیه | اصلی |
| `PTnote` | نکته | تأکید |
| `PTresult` | نتیجه | تأکید |
| `PTpros` | مزایا | سبز |
| `PTcons` | چالش‌ها | سرخ |
| `PTexample` | مثال | دوم |
| `PTcallout` | — (بی‌عنوان) | تأکید |

### فرمان‌های متنی

| فرمان | کار |
|---|---|
| `\en{...}` | یک بازهٔ کوتاه چپ‌به‌راست با قلم لاتین |
| `\hl{...}` | تأکید قوی (رنگ تأکید، سیاه) |
| `\term{...}` | اصطلاح فنی (رنگ اصلی) |
| `\soft{...}` | متن کم‌رنگ |
| `\PTsep` | جداکنندهٔ نقطه‌ای درون‌خطی |
| `PTltr` / `PTrtl` | بلوکِ بندیِ چپ‌به‌راست / راست‌به‌چپ (برای مراجع لاتین) |

### کد

```latex
\begin{frame}[fragile]{عنوان}      % [fragile] فراموش نشود
\begin{PTcode}[language=Python]
def f(x):
    return x + 1
\end{PTcode}
\end{frame}
```

درون `PTcode` فقط **نویسهٔ اَسکی** بنویسید؛ قلم تک‌عرض پیش‌فرض نشانهٔ فارسی ندارد.

### نمودار جعبه‌ای با TikZ

سبک‌های `PTnode`، `PTnodemain`، `PTnodeaccent`، `PTflow`، `PTflowsoft` و `PTcapt`
آماده‌اند. یک نکتهٔ حیاتی:

```latex
\node[PTnode] (a) at (0,0) {\PTrl{بازیابی زندهٔ وب}};
```

متن فارسی درون گره TikZ **باید** در `\PTrl{...}` پیچیده شود، وگرنه واژه‌ها برعکس
می‌آیند. نمونهٔ کامل: `content/04-architecture.tex`.

---

## واژه‌ها را عوض کنید

هر برچسب فارسیِ قالب با `\PTsetlabel` قابل تغییر است — در `config/info.tex`:

```latex
\PTsetlabel{thesisfor}{پایان‌نامه برای دریافت درجهٔ}
\PTsetlabel{supervisor}{استاد راهنما}
\PTsetlabel{outline}{فهرست مطالب}
\PTsetlabel{thanks}{از توجه شما سپاسگزارم}
\PTsetlabel{definition}{تعریف}
```

کلیدهای موجود در بخش ۴ فایل `theme/persian-thesis-utils.sty` و بخش ۱ فایل
`theme/persian-thesis-boxes.sty` فهرست شده‌اند.

## اگر مشکلی پیش آمد

| نشانه | علت و درمان |
|---|---|
| خطای `Package fontspec Error` یا کادر خالی جای حرف‌ها | با `pdflatex` کامپایل کرده‌اید؛ `xelatex` لازم است. |
| واژه‌های فارسیِ نمودار برعکس‌اند | متن گره TikZ را در `\PTrl{...}` نپیچیده‌اید. |
| خطای عجیب روی اسلاید کد | گزینهٔ `[fragile]` را به `\begin{frame}` بدهید. |
| «۷ از ۰» در پانویس | یک بار دیگر کامپایل کنید؛ شمارهٔ کل از فایل `.aux` می‌آید. |
| لوگو دیده نمی‌شود | مسیر باید **کامل و با پسوند** باشد (`figures/logos/x.pdf`)؛ `\graphicspath` در پیدا کردن لوگو دخالت نمی‌کند. |
| هشدار `Unknown \PTsetup key` | نام کلید غلط تایپ شده است؛ جدول بالا را ببینید. |
| فهرست مراجع به‌هم‌ریخته | مدخل‌های لاتین باید درون `PTltr` باشند. |

## پروانه

* کد قالب: **MIT**
* فونت وزیرمتن: **SIL Open Font License 1.1** — متن پروانه در
  `fonts/Vazirmatn/OFL.txt`

رنگ‌های پیش‌تنظیم‌های `universities/` تقریبی و **چشمی** انتخاب شده‌اند و سند رسمی
هویت بصری هیچ دانشگاهی نیستند؛ اگر دانشگاه‌تان راهنمای رنگ رسمی دارد، همان را در
`primary`/`secondary`/`accent` بگذارید.

</div>
