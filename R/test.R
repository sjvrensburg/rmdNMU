#' Create a test document with NMU styling
#'
#' @param ... Additional arguments to [rmarkdown::pdf_document()]
#' @param keep_tex A boolean toggle to select whether intermediate
#'   LaTeX files are to be kept, defaults to `TRUE`
#' @param highlight Syntax highlighting style, defaults to "monochrome"
#'
#' @return R Markdown output format to pass to render
#' @export
tests <- function(..., keep_tex = TRUE, highlight = "monochrome") {
  includes <- get_latex_includes("test")

  # Create highlighting macros file
  highlight_file <- tempfile(fileext = ".tex")
  writeLines(c(
    "% Define colors for syntax highlighting",
    "\\definecolor{CodeBackground}{RGB}{248,248,248}",
    "\\definecolor{CodeKeyword}{RGB}{0,0,255}",
    "\\definecolor{CodeString}{RGB}{163,21,21}",
    "\\definecolor{CodeComment}{RGB}{0,128,0}",
    "",
    "% Configure fancyvrb",
    "\\fvset{",
    "  frame=single,",
    "  numbers=left,",
    "  numbersep=5pt,",
    "  xleftmargin=15pt,",
    "  formatcom=\\color{nmuprimaryblue},",
    "  commandchars=\\\\\\{\\},",
    "  codes={\\catcode`\\$=3\\catcode`\\^=7}",  # Allow math in verbatim
    "}"
  ), highlight_file)

  # Add highlighting macros to includes
  if (is.null(includes$in_header)) {
    includes$in_header <- highlight_file
  } else if (is.character(includes$in_header)) {
    includes$in_header <- c(includes$in_header, highlight_file)
  } else {
    includes$in_header <- c(unlist(includes$in_header), highlight_file)
  }

  fmt <- create_base_pdf_format(
    template = includes$template,
    keep_tex = keep_tex,
    includes = includes,
    highlight = highlight,
    ...
  )

  set_base_knitr_opts(fmt)
  fmt$inherits <- "pdf_document"
  fmt
}
