# 📚 rmdNMU: R Markdown Templates for NMU

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Made for NMU](https://img.shields.io/badge/Made%20for-NMU-yellow.svg)](https://www.mandela.ac.za)

Beautiful R Markdown templates for Nelson Mandela University, styled with 💙 and LaTeX magic ✨

![Divider](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## 🎯 What's Inside?

- 📊 **Practical Templates** - For labs and assignments
- 📝 **Short Notes** - With theorem environments and custom boxes
- 📋 **Test Templates** - Complete with solutions and marking support
- 🎨 **Brand-Aligned** - Uses NMU's official colors and styling

## ⚡ Quick Start

```r
# Install package
remotes::install_github("sjvrensburg/rmdnmu")
```

> 💡 **Requirements**: Just make sure you have LuaTeX installed - we'll handle the fonts automatically!

![Divider](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## 🛠️ Templates

### 🧪 Practicals

Perfect for computer labs and assignments:

```r
---
title: "STAT312: Practical 1"
author: "Future Statistician"
output: 
  rmdNMU::pdf_prac: # or html_prac for web output!
    keep_tex: true
---
```

### 📓 Short Notes

Create beautiful lecture notes with math support:

```r
---
title: "Statistical Magic"
author: "Professor Awesome"
output: rmdNMU::short_notes
---
```

#### ✨ Cool Features

- 📐 Theorem & proof environments
- 📦 Custom info boxes
- 🔗 Smart cross-referencing
- 📊 TikZ diagrams support

### 📝 Tests

Make professional tests and assignments:

```r
---
params:
  subject: "Statistical Methods"
  code: "STAT314"
  test: "The Big One"
  solutions: true
output: rmdNMU::tests
---
```

#### 🎁 Special Features

- ✓ Custom marking symbols (✓, ✓✓, ½✓)
- 📊 Point tracking
- 💻 Code-friendly solutions
- 🎯 Auto-grading support

![Divider](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## 📖 Example Snippets

### 🧮 Mathematical Beauty

```markdown
::: {.theorem #pythagoras name="Pythagoras' Theorem"}
For a right triangle with sides $a$, $b$, and $c$:
$$a^2 + b^2 = c^2$$
:::

::: {.proof}
Magic happens here... ✨
:::
```

### 📋 Test Questions

```markdown
\question[5]
What makes statistics awesome?

\begin{solution}
Everything! \tick
\end{solution}
```

![Divider](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## 🔧 System Requirements

- R (>= 4.0.0)
- LuaTeX
- Required packages: rmarkdown, knitr, tinytex

## 📜 License

GPL (>= 3) - Feel free to use and improve!

---

<div align="center">
  
### Made with 💙 for Nelson Mandela University

*"Education is the most powerful weapon which you can use to change the world."*  
— Nelson Mandela

</div>
