#' Render PDF Document With NMU Short Notes Format
#'
#' @param ... Additional arguments to [rmarkdown::pdf_document()]
#' @param keep_tex A boolean toggle to select whether intermediate
#'   LaTeX files are to be kept, defaults to `TRUE`
#'
#' @return R Markdown output format to pass to render.
#' @export
short_notes <- function(..., keep_tex=TRUE) {
  template <- system.file(
    "rmarkdown/templates/short_notes/resources/template.tex",
    package = "rmdNMU")

  preamble <- system.file(
    "rmarkdown/templates/short_notes/resources/preamble.tex",
    package = "rmdNMU")

  box_filter <- system.file(
    "rmarkdown/templates/short_notes/resources/custom-boxes.lua",
    package = "rmdNMU")

  crossref_filter <- system.file(
    "rmarkdown/templates/short_notes/resources/cross-references.lua",
    package = "rmdNMU")

  fmt <- rmarkdown::pdf_document(
    ...,
    template = template,
    latex_engine = "lualatex",
    keep_tex = keep_tex,
    includes = list(in_header = preamble),
    pandoc_args = c(
      "--lua-filter", box_filter,
      "--lua-filter", crossref_filter,
      "--number-sections",
      "--preserve-tabs",
      "--citeproc"
    )
  )
  fmt
}
