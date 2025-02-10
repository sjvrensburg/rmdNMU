#' Create NMU Beamer Presentation
#'
#' @param ... Additional arguments to [rmarkdown::beamer_presentation()]
#' @param keep_tex Keep generated LaTeX output
#' @param theme The NMU faculty theme to use (one of "humanities", "education",
#'        "business", "sciences", "health", "engineering", "law", "ocean")
#'
#' @return R Markdown output format to pass to render
#' @export
nmu_beamer <- function(..., keep_tex = FALSE, theme = "sciences") {
  template <- system.file(
    "rmarkdown/templates/beamer/resources/template.tex",
    package = "rmdNMU"
  )

  logo <- system.file(
    "rmarkdown/templates/beamer/resources/nmu-logo.png",
    package = "rmdNMU"
  )

  valid_themes <- c("humanities", "education", "business", "sciences",
                    "health", "engineering", "law", "ocean")
  if (!theme %in% valid_themes) {
    warning("Theme not recognized. Using 'sciences' theme.")
    theme <- "sciences"
  }

  font_dir <- format_path_for_pandoc(ensure_fonts())

  args <- list(
    template = template,
    keep_tex = keep_tex,
    latex_engine = "lualatex"
  )

  args$pandoc_args <- c(
    "--variable", sprintf("fontdir=%s", font_dir),
    "--variable", sprintf("nmu_theme=%s", theme),
    "--variable", sprintf("logo=%s", logo)
  )

  do.call(rmarkdown::beamer_presentation, args)
}
