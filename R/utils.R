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
