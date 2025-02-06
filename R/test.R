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

  # Ensure fonts are installed and get the directory
  font_dir <- ensure_fonts()
  font_dir <- format_path_for_pandoc(font_dir)

  base <- rmarkdown::pdf_document(
    ...,
    template = template,
    keep_tex = keep_tex,
    latex_engine = "lualatex",
    includes = list(
      in_header = NULL
    ),
    pandoc_args = c(
      "--variable", paste0("fontdir=", font_dir),
      "--variable", paste0("instructions=", instructions)
    )
  )

  base$inherits <- "pdf_document"
  base$knitr$opts_chunk$prompt <- FALSE
  base$knitr$opts_chunk$comment <- '# '
  base$knitr$opts_chunk$highlight <- TRUE

  return(base)
}
