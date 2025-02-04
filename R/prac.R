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
  rmarkdown::html_document(fig_width = 6.5,
                           fig_height = 4,
                           highlight = 'tango',
                           theme = 'cosmo',
                           css = css,
                           self_contained = TRUE)
}

#' Render PDF Document With NMU-Like Format
#'
#' @param ... Additional arguments to [rmarkdown::pdf_document()]
#' @param keep_tex A boolean toggle to select whether intermediate
#'   LaTeX files are to be kept, defaults to `FALSE`
#'
#' @return R Markdown output format to pass to render.
#' @export
pdf_prac <- function(..., keep_tex=FALSE) {
  template <- system.file(
    "rmarkdown/templates/prac_or_lab/resources/nmu.tex",
    package = "rmdNMU")
  base <- inherit_pdf_document(
    ..., template = template,
    keep_tex = keep_tex)
  base$knitr$opts_chunk$prompt    <- FALSE
  base$knitr$opts_chunk$comment   <- '# '
  base$knitr$opts_chunk$highlight <- TRUE

  return(base)
}

# Call rmarkdown::pdf_document and mark the return value as inheriting pdf_document
inherit_pdf_document <- function(...){
  fmt <- rmarkdown::pdf_document(highlight = "tango", ...)
  fmt$inherits <- "pdf_document"
  return(fmt)
}
