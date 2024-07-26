#' Render HTML Document With NMU Complient Format
#'
#' @param toc Loogical, include table of contents. Default is FALSE.
#'
#' @return R Markdown output format to pass to render.
#' @export
html_prac <- function(toc = FALSE) {

  css <- system.file("rmarkdown/templates/html_prac/resources/air.css",
                     package = "rmdNMU")

  # call the base html_document function
  rmarkdown::html_document(fig_width = 6.5,
                           fig_height = 4,
                           highlight = 'tango',
                           theme = 'cosmo',
                           css = css,
                           self_contained = TRUE)
}
