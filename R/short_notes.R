#' Render PDF Document With NMU Short Notes Format
#'
#' @param ... Additional arguments to [rmarkdown::pdf_document()]
#' @param keep_tex A boolean toggle to select whether intermediate
#'   LaTeX files are to be kept, defaults to `FALSE`
#'
#' @return R Markdown output format to pass to render.
#' @export
short_notes <- function(..., keep_tex=FALSE) {
  template <- system.file(
    "rmarkdown/templates/short_notes/resources/preamble.tex",
    package = "rmdNMU")
  lua_filter <- system.file(
    "rmarkdown/templates/short_notes/resources/custom-boxes.lua",
    package = "rmdNMU")

  rmarkdown::pdf_document(
    ...,
    template = "default",
    latex_engine = "lualatex",
    keep_tex = keep_tex,
    includes = list(in_header = template),
    pandoc_args = c("--lua-filter", lua_filter)
  )
}
