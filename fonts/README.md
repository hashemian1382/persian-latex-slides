<div dir="rtl">

# فونت‌ها

## وزیرمتن (Vazirmatn)

قالب با فونت **وزیرمتن**، ساختهٔ صابر راستی‌کردار، کار می‌کند. همهٔ ۹ وزنِ لازم
در `Vazirmatn/` هست و **نیازی به نصب در سیستم ندارد**: `config/fonts.tex` آن را
با مسیر بار می‌کند.

```
Vazirmatn/
  Vazirmatn-Thin.ttf        Vazirmatn-SemiBold.ttf
  Vazirmatn-ExtraLight.ttf  Vazirmatn-Bold.ttf
  Vazirmatn-Light.ttf       Vazirmatn-ExtraBold.ttf
  Vazirmatn-Regular.ttf     Vazirmatn-Black.ttf
  Vazirmatn-Medium.ttf      OFL.txt
```

نگاشت وزن‌ها در `config/fonts.tex` چنین است:

| نقش | فایل |
|---|---|
| متن عادی | `Regular` |
| سیاه | `Bold` |
| «کج» فارسی (وزیرمتن نویسهٔ کج ندارد) | `Medium` |
| سیاهِ کج | `ExtraBold` |
| `\PTsemibold` (برای `\hl` و `\term`) | `SemiBold` |
| `\PTlight` | `Light` |

وزیرمتن برای **فارسی و لاتین هر دو** به کار می‌رود، تا کل ارائه با یک خانوادهٔ
قلم یکدست بماند. `Mapping=parsidigits` فقط روی قلم فارسی فعال است: رقم‌ها در متن
فارسی، فارسی و درون `\en{...}` انگلیسی می‌مانند.

## فونت دیگری می‌خواهید؟

فایل‌های `ttf`/`otf` را در پوشه‌ای زیر `fonts/` بگذارید و در `config/fonts.tex`
نام و مسیر را عوض کنید:

```latex
\settextfont[
  Path       = fonts/IRANSans/,
  Extension  = .ttf,
  UprightFont = *-Regular,
  BoldFont    = *-Bold,
  Mapping     = parsidigits,
]{IRANSans}
```

اگر فونت جانشین وزن `SemiBold` ندارد، در همان فایل `\PTsemibold` را به
`*-Bold` بدهید.

## قلم تک‌عرض

به‌طور پیش‌فرض تنظیم نشده است و `\ttfamily` همان قلم پیش‌فرض LaTeX می‌ماند —
بی‌نشانهٔ فارسی، اما برای کدِ اَسکی کافی. اگر قلم تک‌عرض دلخواهی دارید، سطر
`\setlatinmonofont` در `config/fonts.tex` را از حالت توضیح در بیاورید.

## پروانه

وزیرمتن زیر پروانهٔ **SIL Open Font License 1.1** منتشر شده است؛ متن کامل در
`Vazirmatn/OFL.txt`. بازتوزیعِ همراهِ این قالب مجاز است، به شرط نگه‌داشتن همان
فایل پروانه.

</div>
