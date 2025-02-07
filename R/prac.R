#' Render HTML Document With NMU Format
#'
#' @param toc Logical, include table of contents. Default is FALSE.
#' @param highlight String or NULL that specifies the code highlighting style.
#' @param ... Ignored
#'
#' @return R Markdown output format to pass to render.
#' @export
html_prac <- function(toc = FALSE, highlight = "tango", ...) {
  css <- system.file("rmarkdown/templates/prac_or_lab/resources/template.css",
                     package = "rmdNMU")

  # call the base html_document function
  rmarkdown::html_document(
    fig_width = 6.5,
    fig_height = 4,
    highlight = highlight,
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
  includes <- get_latex_includes("prac_or_lab")
  fmt <- create_base_pdf_format(includes$template, keep_tex, ...)
  set_base_knitr_opts(fmt)
}
