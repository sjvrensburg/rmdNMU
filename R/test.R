#' Create a test document with NMU styling
#'
#' @param ... Additional arguments to [rmarkdown::pdf_document()]
#' @param keep_tex A boolean toggle to select whether intermediate
#'   LaTeX files are to be kept, defaults to `TRUE`
#'
#' @return R Markdown output format to pass to render
#' @export
tests <- function(..., keep_tex = TRUE) {
  includes <- get_latex_includes("test")
  fmt <- create_base_pdf_format(
    template = includes$template,
    keep_tex = keep_tex,
    includes = list(in_header = includes$instructions),
    ...
  )
  set_base_knitr_opts(fmt)
  fmt$inherits <- "pdf_document"
  fmt
}
