# rmdNMU: R Markdown Templates for Nelson Mandela University

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Made for NMU](https://img.shields.io/badge/Made%20for-NMU-yellow.svg)](https://www.mandela.ac.za)

A simplified R package providing self-contained R Markdown templates for Nelson Mandela University, featuring NMU branding, mathematical typesetting, and professional academic formatting.

---

## 🚨 BREAKING CHANGES - Version 2.0

**This version introduces major breaking changes.** The package has been completely restructured for simplicity and reliability.

### What Changed
- **5 complex templates** → **3 simplified templates**
- **Complex inheritance system** → **Self-contained templates**
- **External dependencies** → **Inline LaTeX code**
- **Function names changed** → **See migration guide below**

---

## New Template Structure

The package now provides **three consolidated templates** that are completely self-contained:

### 1. **Academic Documents** (`nmu_document`)
For academic documents, notes, practicals, and lab reports.
- **Replaces**: `pdf_prac()`, `html_prac()`, `short_notes()`
- **Features**: Table of contents, section numbering, NMU branding

### 2. **Assessments** (`nmu_assessment`) 
For tests, assignments, and exams with optional solutions.
- **Replaces**: `tests()`, `assignments()`
- **Features**: Solutions mode, exam class support, marking symbols

### 3. **Presentations** (`nmu_beamer`)
For academic presentations with faculty color themes.
- **Replaces**: Previous `nmu_beamer()` (simplified)
- **Features**: Faculty themes, professional formatting

---

## 📋 Migration Guide

### Function Name Changes

| **Old Function** | **New Function** | **Notes** |
|------------------|------------------|-----------|
| `pdf_prac()` | `nmu_document()` | Academic documents |
| `html_prac()` | `nmu_document()` | PDF only now |
| `short_notes()` | `nmu_document()` | Same functionality |
| `tests()` | `nmu_assessment()` | With solutions parameter |
| `assignments()` | `nmu_assessment()` | With solutions parameter |
| `nmu_beamer()` | `nmu_beamer()` | Simplified, theme parameter |

### Template Name Changes

| **Old Template** | **New Template** |
|------------------|------------------|
| "NMU Practical Document" | "NMU Document" |
| "NMU Short Notes" | "NMU Document" |
| "NMU Test Template" | "NMU Assessment" |
| "NMU Assignment Template" | "NMU Assessment" |
| "NMU Beamer Presentation" | "NMU Beamer" |

### Code Migration Examples

**Before (v1.x):**
```r
# Old usage
output: rmdNMU::pdf_prac
output: rmdNMU::short_notes
output: rmdNMU::tests
output: rmdNMU::assignments
```

**After (v2.0):**
```r
# New usage
output: rmdNMU::nmu_document
output: rmdNMU::nmu_document
output: rmdNMU::nmu_assessment
output: rmdNMU::nmu_assessment
```

---

## Installation

### Install from GitHub
```r
# Install the restructured version
remotes::install_github("sjvrensburg/rmdNMU", ref = "pandoc_fix")
```

### System Requirements
- **R**: Version ≥ 4.0.0
- **LaTeX Engine**: XeLaTeX (recommended) or LuaTeX
- **Fonts**: Nunito Sans (included in package)

**Note**: All LaTeX dependencies are now inline - no external files needed!

---

## Quick Start

### Via RStudio Interface

1. Navigate to `File → New File → R Markdown...`
2. Select "From Template"
3. Choose from the **3 new templates**:
   - **"NMU Document"** - For academic documents, notes, practicals
   - **"NMU Assessment"** - For tests, assignments, exams
   - **"NMU Beamer"** - For presentations

### Programmatic Creation
```r
# Create new documents from templates
rmarkdown::draft("my-document", template = "nmu_document", package = "rmdNMU")
rmarkdown::draft("my-test", template = "nmu_assessment", package = "rmdNMU")
rmarkdown::draft("my-slides", template = "nmu_beamer", package = "rmdNMU")
```

### Direct Usage
```r
# Render documents directly
rmarkdown::render("document.Rmd", nmu_document())
rmarkdown::render("test.Rmd", nmu_assessment(solutions = TRUE))
rmarkdown::render("slides.Rmd", nmu_beamer(theme = "sciences"))
```

---

## Usage Examples

### 1. NMU Document Template

**For**: Academic documents, notes, practicals, lab reports

```yaml
---
title: "Statistical Methods Notes"
author: "Dr. Academic Name"
date: "`r Sys.Date()`"
output: 
  rmdNMU::nmu_document:
    toc: true
    number_sections: true
---
```

**Features**:
- Table of contents and section numbering
- Mathematical notation support
- Code highlighting
- NMU branding and colors

### 2. NMU Assessment Template

**For**: Tests, assignments, exams with solutions

```yaml
---
title: "STAT314 Test 1"
author: "Dr. Examiner Name"
date: "`r Sys.Date()`"
params:
  solutions: false  # Set to true for solution version
output: 
  rmdNMU::nmu_assessment:
    solutions: !r params$solutions
---
```

**Question Format**:
```latex
## Question 1 [10 marks]

What is the sample mean formula?

$if(params.solutions)$
**Solution**: The sample mean is $\bar{x} = \frac{1}{n}\sum_{i=1}^n x_i$
$endif$
```

**Features**:
- Solutions toggle (show/hide)
- Exam class formatting
- Assessment symbols (`\tick`, `\halftick`)
- Professional layout

### 3. NMU Beamer Template

**For**: Academic presentations with faculty themes

```yaml
---
title: "Research Presentation"
author: "Presenter Name"
date: "`r Sys.Date()`"
output: 
  rmdNMU::nmu_beamer:
    theme: "sciences"  # Faculty theme
---
```

**Available Faculty Themes**:
- `sciences` - Green (default)
- `business` - Purple  
- `humanities` - Orange
- `education` - Red
- `health` - Light green
- `engineering` - Blue
- `law` - Blue-violet
- `ocean` - Teal

**Features**:
- Faculty-specific color schemes
- Professional slide layouts
- Mathematical notation support
- Code highlighting

---

## Key Benefits

### ✅ Simplified Architecture
- **Self-contained templates** - No external dependencies
- **Inline LaTeX code** - No complex file paths or inheritance
- **Zero conflicts** - No duplicate command definitions

### ✅ Reliable Compilation
- **Consistent results** across all environments
- **No missing file errors** - Everything is inline
- **Faster compilation** - Reduced file system overhead

### ✅ Easy Maintenance
- **3 templates instead of 5** - Simplified structure
- **Clear documentation** - Easy to understand and use
- **Better error messages** - Clearer debugging

### ✅ Preserved Functionality
- **Full NMU branding** - All colors and fonts maintained
- **Mathematical notation** - Complete LaTeX math support
- **Code highlighting** - Syntax highlighting preserved
- **Professional formatting** - Academic document standards

---

## Technical Details

### Typography
- **Primary Font**: Nunito Sans (bundled)
- **Mathematical Font**: lete-sans-math integration
- **LaTeX Engine**: XeLaTeX (recommended)

### NMU Color Palette
All NMU colors are built into each template:
- **Primary**: NMU Blue (#141C2B), NMU Yellow (#FFCC00)
- **Faculty Colors**: Sciences, Business, Humanities, Education, Health, Engineering, Law, Ocean

### Package Structure (Simplified)
```
rmdNMU/
├── R/
│   ├── nmu_document.R     # Academic documents function
│   ├── nmu_assessment.R   # Assessment function  
│   └── nmu_beamer.R       # Presentation function
├── inst/rmarkdown/templates/
│   ├── nmu_document/      # Self-contained template
│   ├── nmu_assessment/    # Self-contained template
│   └── nmu_beamer/        # Self-contained template
└── inst/fonts/            # Nunito Sans fonts
```

---

## Troubleshooting

### Common Issues

**Template not found**:
```r
# Verify installation
packageVersion("rmdNMU")
library(rmdNMU)
```

**LaTeX compilation errors**:
```r
# Check LaTeX installation
tinytex::is_tinytex()

# Install missing packages
tinytex::tlmgr_install("package-name")
```

**Font issues**:
```r
# Reinstall fonts
rmdNMU::install_fonts()
```

---

## What's New in v2.0

### Major Improvements
- ✅ **Eliminated LaTeX conflicts** - No more compilation errors
- ✅ **Simplified architecture** - 3 templates instead of 5
- ✅ **Self-contained templates** - No external dependencies
- ✅ **Faster compilation** - Reduced overhead
- ✅ **Better reliability** - Consistent results across environments

### Breaking Changes
- 🔄 **Function names changed** - See migration guide above
- 🔄 **Template names updated** - New naming convention
- ❌ **HTML output removed** - PDF only for consistency
- ❌ **Complex inheritance removed** - Simplified structure

---

## Support

**Package Maintainer**: Stéfan Janse van Rensburg  
**Institution**: Department of Statistics, Nelson Mandela University  
**License**: GNU General Public License (≥ 3)

For issues or questions, please use the GitHub repository issue tracker.

---

<div align="center">

**Simplified. Reliable. Professional.**

*NMU R Markdown Templates v2.0*

</div>
