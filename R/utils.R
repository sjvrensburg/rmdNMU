#' Internal function to ensure fonts are installed
#' @keywords internal
ensure_fonts <- function() {
  # Get the package font directory
  pkg_font_dir <- system.file("fonts", "nunito-sans", package = "rmdNMU")
  if (!dir.exists(pkg_font_dir)) {
    stop("Font directory not found in package")
  }

  # Create fonts directory in working directory if it doesn't exist
  local_font_dir <- file.path(getwd(), "fonts", "nunito-sans")
  if (!dir.exists(local_font_dir)) {
    dir.create(local_font_dir, recursive = TRUE)
  }

  # Define font files to copy
  font_files <- c("NunitoSans-Regular.ttf", "NunitoSans-Italic.ttf")

  # Check which fonts need to be copied
  fonts_to_install <- font_files[!file.exists(file.path(local_font_dir, font_files))]

  if (length(fonts_to_install) > 0) {
    # Copy missing fonts
    for (font in fonts_to_install) {
      src_path <- file.path(pkg_font_dir, font)
      dest_path <- file.path(local_font_dir, font)

      if (file.exists(src_path)) {
        file.copy(src_path, dest_path, overwrite = TRUE)
      } else {
        stop("Required font file not found in package: ", font)
      }
    }
  }

  # Return the local font directory path
  normalizePath(local_font_dir)
}

#' Format path for Pandoc
#' @keywords internal
format_path_for_pandoc <- function(path) {
  # Convert backslashes to forward slashes
  path <- gsub("\\\\", "/", path)
  # Escape spaces and special characters
  path <- gsub(" ", "\\ ", path)
  path
}

#' Base PDF format creator
#' @keywords internal
create_base_pdf_format <- function(template_path, keep_tex = TRUE, includes = NULL, pandoc_args = NULL, ...) {
  # Get paths
  base_template <- system.file(
    "rmarkdown/templates/common/base_template.tex",
    package = "rmdNMU"
  )
  font_dir <- format_path_for_pandoc(ensure_fonts())

  # Combine default and additional pandoc args
  default_args <- c(
    "--variable", paste0("fontdir=", font_dir),
    "--variable", paste0("base_template=", base_template)
  )
  all_args <- c(default_args, pandoc_args)

  # Create format with explicit includes handling
  args <- list(
    template = template_path,
    latex_engine = "lualatex",
    keep_tex = keep_tex,
    pandoc_args = all_args
  )

  # Add includes if provided
  if (!is.null(includes)) {
    args$includes <- includes
  }

  # Add additional arguments
  args <- c(args, list(...))

  do.call(rmarkdown::pdf_document, args)
}

#' Base knitr options setter
#' @keywords internal
set_base_knitr_opts <- function(fmt) {
  fmt$knitr$opts_chunk$prompt <- FALSE
  fmt$knitr$opts_chunk$comment <- '# '
  fmt$knitr$opts_chunk$highlight <- TRUE
  fmt
}

#' Shared font configuration
#' @keywords internal
configure_fonts <- function() {
  font_dir <- ensure_fonts()
  format_path_for_pandoc(font_dir)
}

#' Common LaTeX includes
#' @keywords internal
get_latex_includes <- function(type) {
  base_path <- system.file("rmarkdown/templates", type, "resources", package = "rmdNMU")
  list(
    template = file.path(base_path, "template.tex"),
    preamble = file.path(base_path, "preamble.tex")
  )
}
