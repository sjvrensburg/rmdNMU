# rmdNMU: R Markdown Templates for Nelson Mandela University

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Made for NMU](https://img.shields.io/badge/Made%20for-NMU-yellow.svg)](https://www.mandela.ac.za)

A comprehensive R package providing institutional R Markdown templates for Nelson Mandela University's Statistics Department, featuring advanced LaTeX integration, mathematical typesetting, and brand-compliant formatting.

---
**NOTE:** The rmdNMU package is currently broken. For similar functionality, please consider using [rmdNMUsimple](https://github.com/sjvrensburg/rmdNMUsimple), which is simpler and more robust.
---

## Template Portfolio

The package delivers five specialised document classes designed for academic and administrative purposes:

### 1. **Practical Documents** (`html_prac`, `pdf_prac`)
Laboratory assignments and computational coursework with dual-format output capability supporting both web and print distribution.

### 2. **Short Notes** (`short_notes`)
Academic lecture notes featuring enhanced mathematical environments, theorem frameworks, cross-referencing systems, and custom information boxes.

### 3. **Assessment Documents** (`tests`, `assignments`)
Examination papers and marked assignments with integrated solution environments, automated point calculation, and assessment marking symbols.

### 4. **Presentation Templates** (`nmu_beamer`)
Beamer presentations with faculty-specific colour themes and institutional branding across eight faculty divisions.

---

## Installation Instructions

### Standard Installation
```r
# Install from GitHub repository
remotes::install_github("sjvrensburg/rmdnmu")
```

**System Requirements**: LuaTeX installation required. All font dependencies and essential LaTeX packages (`unicode-math`, `lete-sans-math`) are installed automatically upon first package load.

**Note**: No additional LaTeX packages require manual installation. The package manages all mathematical typography dependencies through its integrated font system.

---

## Document Creation Workflow

### Via RStudio Interface

1. Navigate to `File → New File → R Markdown...`
2. Select "From Template"
3. Choose appropriate NMU template:

   - "NMU Practical Document"
   - "NMU Short Notes" 
   - "NMU Test Template"
   - "NMU Assignment Template"
   - "NMU Beamer Presentation"

4. Configure document parameters and location
5. Generate template with comprehensive examples

### Programmatic Creation
```r
# Create new document from template
rmarkdown::draft("document_name", template = "template_name", package = "rmdNMU")
```

---

## Template Specifications

### Practical Documents

**Purpose**: Laboratory exercises, computational assignments, and coursework submission.

**Output Formats**: HTML (`html_prac`) and PDF (`pdf_prac`)

```yaml
---
student_number: "123456789"
name: "Student Name"
surname: "Student Surname"
module: "STAT312"
type: "Practical"
number: 1
output: 
  rmdNMU::pdf_prac:
    keep_tex: false
    highlight: "tango"
---
```

**Key Features**:

- Automated title generation from metadata
- Integrated code highlighting with multiple theme options
- Responsive figure sizing and alignment
- Cross-platform font rendering using bundled Nunito Sans

### Short Notes

**Purpose**: Academic lecture notes with mathematical content and structured theorem environments.

```yaml
---
title: "Statistical Theory Foundations"
author: "Dr. Academic Name"
documentclass: extarticle
fontsize: 14pt
output:
  rmdNMU::short_notes:
    keep_tex: false
    highlight: "tango"
---
```

**Mathematical Environments**:
```markdown
::: {.theorem #central-limit name="Central Limit Theorem"}
For independent random variables $X_1, X_2, \ldots, X_n$ with finite mean $\mu$ and variance $\sigma^2$:
$$\frac{\bar{X}_n - \mu}{\sigma/\sqrt{n}} \xrightarrow{d} \mathcal{N}(0,1)$$
:::

::: {.proof}
The proof follows from characteristic function convergence...
:::
```

**Available Environments**:

- `theorem`, `lemma`, `proposition`, `corollary`
- `definition`, `example`, `remark`, `note`
- `proof` (with automatic QED symbol)

**Custom Information Boxes**:
```markdown
::: {.examplebox name="Worked Example"}
Detailed example content with enhanced formatting...
:::

::: {.warningbox name="Important Note"}
Critical information highlighted for student attention...
:::

::: {.importantbox name="Key Concept"}
Essential theoretical concepts requiring emphasis...
:::
```

**Cross-Referencing System**:
```markdown
As demonstrated in [@thm:central-limit], the distribution approaches normality.
See [@def:probability-space] for formal definition.
```

### Assessment Documents

**Purpose**: Examinations, tests, and marked assignments with integrated solution management.

#### Test Documents
```yaml
---
params:
  subject: "Statistical Methods"
  code: "STAT314"
  test: "Test 1"
  examiner: "Dr. Examiner Name"
  timelimit: "2 Hours"
  solutions: true  # Toggle solution visibility
  instructions: true
  pointtable: false
fontsize: 14pt
output: 
  rmdNMU::tests:
    keep_tex: false
---
```

#### Assignment Documents
```yaml
---
params:
  code: "STAT314"
  description: "Assignment 1"
  solutions: true
fontsize: 14pt
output: 
  rmdNMU::assignments:
    keep_tex: false
---
```

**Question Framework**:
```latex
\question[5]
Derive the maximum likelihood estimator for normal distribution parameters.

\begin{solution}[4cm]
Given the likelihood function:
$$L(\mu, \sigma^2) = \prod_{i=1}^n \frac{1}{\sqrt{2\pi\sigma^2}} \exp\left(-\frac{(x_i-\mu)^2}{2\sigma^2}\right)$$

The MLE estimates are:
- $\hat{\mu} = \bar{x}$ \tick
- $\hat{\sigma}^2 = \frac{1}{n}\sum_{i=1}^n (x_i - \bar{x})^2$ \tick
\end{solution}
```

**Multi-part Questions**:
```latex
\question[8]
Consider the regression model $Y = X\beta + \epsilon$.

\begin{parts}
\part[3] Derive the ordinary least squares estimator.
\part[3] Prove the estimator is unbiased.
\part[2] State the Gauss-Markov conditions.
\end{parts}
\droptotalpoints
```

**Code in Solutions**:
```latex
\begin{solutioncode}
```{r}
# R code within assessment solutions
model <- lm(y ~ x, data = dataset)
summary(model)
```
\end{solutioncode}
```

**Assessment Symbols**:

- `\tick` - Correct answer marker
- `\doubletick` - Excellent response indicator
- `\halftick` - Partial credit symbol

### Presentation Templates

**Purpose**: Academic presentations with faculty-specific branding and institutional compliance.

```yaml
---
title: "Research Presentation"
subtitle: "Statistical Analysis Results"
author: "Presenter Name"
institute: "Department of Statistics\\\\Nelson Mandela University"
output: 
  rmdNMU::nmu_beamer:
    theme: "sciences"
    keep_tex: false
---
```

**Available Themes**:

- `humanities` - Orange theme for Humanities Faculty
- `education` - Red theme for Education Faculty  
- `business` - Purple theme for Business Faculty
- `sciences` - Green theme for Sciences Faculty
- `health` - Light green theme for Health Sciences
- `engineering` - Blue theme for Engineering Faculty
- `law` - Blue-violet theme for Law Faculty
- `ocean` - Teal theme for Ocean Sciences Institute

---

## Advanced Technical Features

### Typography System

- **Primary Font**: Nunito Sans (bundled with package)
- **Mathematical Font**: STIX Two Math with lete-sans-math integration
- **Code Font**: Fira Mono with ligature support
- **Emoji Support**: Native Unicode emoji rendering via `emoji` package

### Institutional Colour Palette
```latex
% Primary colours
\definecolor{nmuprimaryblue}{HTML}{141C2B}
\definecolor{nmusecondaryblue}{HTML}{132E51}
\definecolor{nmuprimaryyellow}{HTML}{FFCC00}
\definecolor{nmusecondaryyellow}{HTML}{F9B22A}

% Faculty-specific colours
\definecolor{nmuhumanities}{HTML}{FFB51B}
\definecolor{nmueducation}{HTML}{F14F13}
\definecolor{nmubusiness}{HTML}{6C284F}
\definecolor{nmusciences}{HTML}{006B34}
\definecolor{nmuhealth}{HTML}{82B74A}
\definecolor{nmuengineering}{HTML}{57BCE9}
\definecolor{nmulaw}{HTML}{5E6EBA}
\definecolor{nmuocean}{HTML}{00AFAA}
```

### TikZ Integration
Comprehensive TikZ library support for advanced graphics:

```latex
\begin{tikzpicture}
\begin{axis}[
    xlabel=$x$,
    ylabel=$f(x)$,
    title={Normal Distribution},
    grid=major,
    axis lines=middle
]
\addplot[thick, nmuprimaryblue] {exp(-x^2/2)/sqrt(2*pi)};
\end{axis}
\end{tikzpicture}
```

**Available TikZ Libraries**:

- Core: `arrows.meta`, `calc`, `intersections`
- Mathematical: `angles`, `quotes`, `patterns`
- Plotting: `plotmarks`, `positioning`, `3d`
- Shapes: `shapes.geometric`, `shapes.arrows`
- Advanced: `pgfplots`, `datavisualization`

### Font Management System
```r
# Automatic font installation occurs during package loading
# Manual installation if required:
rmdNMU::install_fonts()

# Font configuration verification:
font_dir <- rmdNMU:::ensure_fonts()
```

---

## Technical Architecture

### Core Dependencies

- **R**: Version ≥ 4.0.0
- **Essential Packages**: `rmarkdown`, `knitr`, `tinytex`
- **LaTeX Engine**: LuaTeX (required for advanced font handling)
- **Optional**: TinyTeX for lightweight LaTeX distribution

### Package Structure
```
rmdNMU/
├── R/                          # Core functions and output formats
├── inst/rmarkdown/templates/   # Template definitions
│   ├── common/                 # Shared LaTeX base template
│   ├── prac_or_lab/           # Practical document templates
│   ├── short_notes/           # Academic notes with Lua filters
│   ├── test/                  # Examination templates
│   ├── assignment/            # Assignment templates
│   └── beamer/                # Presentation templates
├── inst/fonts/                # Bundled Nunito Sans typefaces
│   ├── nunito-sans/           # Regular and italic variants
│   └── firamath/              # Mathematical symbols (backup)
└── man/                       # Documentation files
```

### Automatic LaTeX Package Management
The package automatically installs required LaTeX dependencies:
```r
# Packages installed during .onLoad():
unicode-math      # Unicode mathematical symbols
lete-sans-math    # Sans-serif mathematical typography
```

---

## Usage Examples and Best Practices

### Document Preparation Workflow

1. **Template Selection**: Choose appropriate template for document purpose
2. **Metadata Configuration**: Complete all YAML parameters accurately
3. **Content Development**: Utilise template-specific environments and formatting
4. **Quality Assurance**: Verify mathematical notation and cross-references
5. **Output Generation**: Compile to target format with appropriate settings

### Code Chunk Configuration
```r
knitr::opts_chunk$set(
  echo = TRUE,           # Display code in output
  warning = FALSE,       # Suppress warnings
  message = FALSE,       # Suppress messages
  fig.align = 'center',  # Centre figure alignment
  out.width = '80%',     # Responsive figure sizing
  comment = '',          # Remove output prefixes
  results = 'hold'       # Collect output together
)
```

### Mathematical Notation Guidelines
```latex
% Inline mathematics
The sample mean $\bar{x} = \frac{1}{n}\sum_{i=1}^n x_i$ provides an unbiased estimator.

% Display mathematics
$$\mathbb{E}[\bar{X}] = \mathbb{E}\left[\frac{1}{n}\sum_{i=1}^n X_i\right] = \frac{1}{n}\sum_{i=1}^n \mathbb{E}[X_i] = \mu$$
```

### Cross-Reference Implementation
```markdown
::: {.definition #sample-mean name="Sample Mean"}
The sample mean of observations $x_1, \ldots, x_n$ is defined as:
$$\bar{x} = \frac{1}{n}\sum_{i=1}^n x_i$$
:::

As shown in [@def:sample-mean], the estimator exhibits desirable properties.
```

---

## Performance Optimisation

### Compilation Settings
```yaml
# Recommended settings for production documents
output:
  rmdNMU::pdf_prac:
    keep_tex: false      # Reduce file system overhead
    highlight: "tango"   # Optimal readability balance
```

### Resource Management

- **Font Loading**: Occurs once per R session
- **TikZ Processing**: May extend compilation time for complex diagrams
- **Large Documents**: Consider document sectioning for extensive content

---

## Troubleshooting Guide

### Common Installation Issues

**Font Rendering Problems**:
```r
# Verify LuaTeX installation
tinytex:::is_tinytex()

# Reinstall fonts if necessary
rmdNMU::install_fonts()
```

**Missing LaTeX Packages**:
```r
# Install specific packages manually
tinytex::tlmgr_install(c("unicode-math", "lete-sans-math"))

# Update LaTeX distribution
tinytex::tlmgr_update()
```

**Template Not Found**:
```r
# Verify package installation
packageVersion("rmdNMU")

# Restart R session and reload
detach("package:rmdNMU", unload = TRUE)
library(rmdNMU)
```

### Performance Diagnostics
```r
# Check compilation time for large documents
system.time(rmarkdown::render("document.Rmd"))

# Memory usage monitoring
pryr::mem_used()
```

---

## Licensing and Compliance

**License**: GNU General Public License (≥ 3)

**Institutional Compliance**: Templates adhere to Nelson Mandela University visual identity guidelines where applicable, providing consistent branding across academic documents.

**Academic Use**: Freely available for educational and research purposes under GPL license terms. Commercial usage permitted subject to license conditions.

---

## Development and Support

**Package Maintainer**: Stéfan Janse van Rensburg  
**Institutional Affiliation**: Department of Statistics, Nelson Mandela University  
**ORCID**: 0000-0002-0749-2277

**Technical Support**: For bug reports, feature requests, or implementation assistance, please contact the package maintainer through appropriate institutional channels.

**Version Information**: Current package version supports R ≥ 4.0.0 with backward compatibility for essential features.

---

<div align="center">

**Enhancing Academic Communication Through Principled Document Design**

*Empowering Nelson Mandela University's Academic Community*

</div>
