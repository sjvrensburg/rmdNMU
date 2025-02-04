#' Render HTML Document With NMU Format
#'
#' @param toc Logical, include table of contents. Default is FALSE.
#'
#' @return R Markdown output format to pass to render.
#' @export
html_prac <- function(toc = FALSE) {
  css <- system.file("rmarkdown/templates/prac_or_lab/resources/nmu.css",
                     package = "rmdNMU")

  # call the base html_document function
  rmarkdown::html_document(
    fig_width = 6.5,
    fig_height = 4,
    highlight = 'tango',
    theme = NULL, # Remove default theme to use our custom CSS fully
    css = css,
    self_contained = TRUE,
    toc = toc)
}

#' Render PDF Document With NMU Format
#'
#' @param ... Additional arguments to [rmarkdown::pdf_document()]
#' @param keep_tex A boolean toggle to select whether intermediate
#'   LaTeX files are to be kept, defaults to `FALSE`
#'
#' @return R Markdown output format to pass to render.
#' @export
pdf_prac <- function(..., keep_tex = FALSE) {
  template <- system.file(
    "rmarkdown/templates/prac_or_lab/resources/nmu.tex",
    package = "rmdNMU")

  # Get the font directory path and escape spaces/special chars
  font_dir <- gsub("\\", "/", system.file("fonts", "nunito-sans", package = "rmdNMU"), fixed = TRUE)

  # Create format with font directory variable
  fmt <- rmarkdown::pdf_document(
    ...,
    template = template,
    latex_engine = "lualatex",
    keep_tex = keep_tex,
    pandoc_args = c(
      "--variable", sprintf("fontdir=%s", font_dir)
    )
  )

  # Set chunk options
  fmt$knitr$opts_chunk$prompt <- FALSE
  fmt$knitr$opts_chunk$comment <- '# '
  fmt$knitr$opts_chunk$highlight <- TRUE

  return(fmt)
}

# Helper function to inherit from pdf_document
inherit_pdf_document <- function(...) {
  fmt <- rmarkdown::pdf_document(...)
  fmt$inherits <- "pdf_document"
  return(fmt)
}
