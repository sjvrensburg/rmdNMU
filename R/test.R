#' Create a test document with NMU styling
#'
#' @param ... Additional arguments to [rmarkdown::pdf_document()]
#' @param keep_tex A boolean toggle to select whether intermediate
#'   LaTeX files are to be kept, defaults to `TRUE`
#'
#' @return R Markdown output format to pass to render
#' @export
tests <- function(..., keep_tex = TRUE) {
  template <- system.file(
    "rmarkdown", "templates", "test", "resources",
    "template.tex", package = "rmdNMU")

  instructions <- system.file(
    "rmarkdown", "templates", "test", "resources",
    "instructions.tex", package = "rmdNMU")

  base <- inherit_pdf_document(
    ...,
    template = template,
    keep_tex = keep_tex,
    includes = list(
      in_header = NULL  # Add any header files if needed
    ),
    pandoc_args = c(
      "--variable", paste0("instructions=", instructions)
    )
  )

  base$knitr$opts_chunk$prompt <- FALSE
  base$knitr$opts_chunk$comment <- '# '
  base$knitr$opts_chunk$highlight <- TRUE

  return(base)
}

# Helper function to inherit from pdf_document
inherit_pdf_document <- function(...) {
  fmt <- rmarkdown::pdf_document(highlight = "monochrome", ...)
  fmt$inherits <- "pdf_document"
  return(fmt)
}
