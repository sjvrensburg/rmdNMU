# rmdNMU: R Markdown Templates for NMU

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Made for NMU](https://img.shields.io/badge/Made%20for-NMU-yellow.svg)](https://www.mandela.ac.za)

Professional R Markdown templates for Nelson Mandela University, featuring comprehensive LaTeX integration and institutional styling.

---

## Features

- **Practical Templates** - For laboratory assignments and coursework
- **Short Notes** - Including theorem environments and specialized formatting
- **Test Templates** - With integrated solutions and assessment tools
- **Brand Compliance** - Largely follows NMU's official design guidelines

## Installation

```r
# Install package
remotes::install_github("sjvrensburg/rmdnmu")

# OPTIONAL BUT RECOMMENDED
# Install firamath LaTeX package for enhanced math typography
tinytex::tlmgr_install("firamath")
```

**Note**: Requires LuaTeX installation - all other dependencies are handled automatically.

---

## Usage Instructions

Creating documents with these templates in RStudio:

1. Navigate to `File > New File > R Markdown...`
2. Select "From Template"
3. Choose from available NMU templates:
   - "NMU Practical Document"
   - "NMU Short Notes"
   - "NMU Test Template"
4. Specify document name and location
5. Click "OK" to generate the template

**Note**: Each template includes comprehensive example content for reference.

## Template Documentation

### Practical Documents

Designed for laboratory work and assignments:

```r
---
title: "STAT312: Practical 1"
author: "Student Name"
output: 
  rmdNMU::pdf_prac: # Alternative: html_prac for web format
    keep_tex: true
---
```

### Short Notes

Designed for lecture notes with mathematical typesetting:

```r
---
title: "Statistical Theory"
author: "Instructor Name"
output: rmdNMU::short_notes
---
```

#### Features

- Theorem and proof environments
- Information boxes
- Cross-referencing system
- TikZ diagram support

### Test Documents

Designed for pen-and-paper tests and assignments:

```r
---
params:
  subject: "Statistical Methods"
  code: "STAT314"
  test: "Assessment 1"
  solutions: true
output: rmdNMU::tests
---
```

#### Capabilities

- Assessment marking symbols
- Point calculation
- Solution formatting
- Automated grading support

---

## Implementation Examples

### Mathematical Typesetting

```markdown
::: {.theorem #pythagoras name="Pythagoras' Theorem"}
For a right triangle with sides $a$, $b$, and $c$:
$$a^2 + b^2 = c^2$$
:::

::: {.proof}
Proof details...
:::
```

### Assessment Format

```markdown
\question[5]
Explain the central limit theorem.

\begin{solution}
Detailed solution... \tick
\end{solution}
```

---

## Technical Requirements

- R (>= 4.0.0)
- LuaTeX
- Dependencies: rmarkdown, knitr, tinytex

## License

GPL (>= 3) - Available for use and modification under license terms.

---

<div align="center">

**Let's make academic documents great again!**

</div>
