# rmdNMU: R Markdown Templates for Nelson Mandela University

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
<!-- badges: end -->

## Overview

The `rmdNMU` package provides R Markdown templates designed for use at Nelson Mandela University's Statistics Department. These templates implement the university's branding guidelines, following colours and fonts specified in the [Nelson Mandela University Digital Brand Guide](https://staff.mandela.ac.za/staff/media/Store/documents/InstID/Manual/Nelson-Mandela-University-Digital-Brand-Guide.pdf).

## Installation

You can install the development version of rmdNMU from [GitHub](https://github.com/) with:

```r
# Install the remotes package if you haven't already
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

# Install rmdNMU
remotes::install_github("sjvrensburg/rmdNMU")
```

### Prerequisites

To use PDF output formats, you need a working LaTeX installation. We recommend using TinyTeX, a lightweight LaTeX distribution designed for R Markdown:

```r
install.packages("tinytex")
tinytex::install_tinytex()
```

For more information about TinyTeX, see the [official documentation](https://yihui.org/tinytex/).

## Available Templates

### 1. Practical/Lab Template

This template is designed for creating practical assignments and lab exercises.

#### Features:
- Clean, professional layout with NMU branding
- Available in both HTML and PDF formats
- Built-in support for code chunks and output
- Structured metadata for student and course information

#### Usage:
```r
# For HTML output
output: rmdNMU::html_prac

# For PDF output
output: rmdNMU::pdf_prac
```

#### Template-specific YAML options:
```yaml
student_number: "123456789"
name: "Name"
surname: "Surname"
module: "STAT312"
type: "Practical"
number: 1
```

### 2. Short Notes Template

This template is designed for creating lecture notes, handouts, or brief technical documents.

#### Features:
- Professional academic styling with NMU branding
- Custom box environments for examples, warnings, and important notes
- Full LaTeX capabilities with custom preamble
- Support for mathematical notation and theorems

#### Usage:
```r
output: rmdNMU::short_notes
```

#### Special Box Environments:
```markdown
::: {.examplebox name="Title"}
Content goes here
:::

::: {.importantbox name="Key Point"}
Content goes here
:::

::: {.warningbox name="Caution"}
Content goes here
:::

::: {.notebox name="Note"}
Content goes here
:::

::: {.tipbox name="Tip"}
Content goes here
:::
```

## Usage in RStudio

The easiest way to use these templates is through RStudio:

1. Click File → New File → R Markdown...
2. In the dialogue box, click "From Template"
3. Select either "Computer Lab or Practical Exercises" or "Short Notes"
4. Click "OK"

## Colour Scheme

The templates use Nelson Mandela University's official colours:

- Primary Blue: #141C2B
- Secondary Blue: #132E51
- Primary Yellow: #FFCC00
- Secondary Yellow: #F9B22A
- Grey: #999999

Faculty-specific colours are also available in the LaTeX templates:

- Humanities: #FFB51B
- Education: #F14F13
- Business: #6C284F
- Sciences: #006B34
- Health: #82B74A
- Engineering: #57BCE9
- Law: #5E6EBA
- Ocean Sciences: #00AFAA

### Using Colors in LaTeX Documents

All colours are predefined in the LaTeX templates and can be accessed using their LaTeX names:

Primary Colours:
```latex
\color{nmuprimaryblue}{Text in primary blue}
\color{nmusecondaryblue}{Text in secondary blue}
\color{nmuprimaryyellow}{Text in primary yellow}
\color{nmusecondaryyellow}{Text in secondary yellow}
\color{nmugrey}{Text in grey}
```

Faculty Colours:
```latex
\color{nmuhumanities}{Humanities text}
\color{nmueducation}{Education text}
\color{nmubusiness}{Business text}
\color{nmusciences}{Sciences text}
\color{nmuhealth}{Health text}
\color{nmuengineering}{Engineering text}
\color{nmulaw}{Law text}
\color{nmuocean}{Ocean Sciences text}
```

You can use these colors in any LaTeX context, for example:
```latex
{\color{nmuprimaryblue} This entire paragraph will be in NMU primary blue.}

\textcolor{nmuhealth}{Just this text will be in health sciences green.}

\begin{itemize}
\item[\textcolor{nmuprimaryyellow}{$\bullet$}] Item with yellow bullet point
\end{itemize}
```

## Contributing

Contributions are welcome! Please feel free to submit a pull request.

## License

This project is licensed under the GPL-3 License - see the [LICENSE.md](LICENSE.md) file for details.

## Author

Stéfan Janse van Rensburg (stefanj@mandela.ac.za)
ORCID: 0000-0002-0749-2277
