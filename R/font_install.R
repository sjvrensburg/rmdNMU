#' Install required fonts for rmdNMU templates
#' @export
install_fonts <- function() {
  # Get the font directory
  font_dir <- system.file("fonts", "nunito-sans", package = "rmdNMU")
  if (!dir.exists(font_dir)) {
    stop("Font directory not found in package")
  }

  # Get user's font directory
  if (.Platform$OS.type == "windows") {
    user_font_dir <- file.path(Sys.getenv("LOCALAPPDATA"), "Microsoft", "Windows", "Fonts")
  } else if (Sys.info()["sysname"] == "Darwin") {
    user_font_dir <- "~/Library/Fonts"
  } else {
    user_font_dir <- path.expand("~/.local/share/fonts")
  }

  # Create directory if it doesn't exist
  if (!dir.exists(user_font_dir)) {
    dir.create(user_font_dir, recursive = TRUE)
  }

  # Define font files - using actual filenames in package
  font_files <- c("NunitoSans-Regular.ttf", "NunitoSans-Italic.ttf")

  # Copy fonts
  fonts_installed <- 0
  for (font in font_files) {
    src_path <- file.path(font_dir, font)
    dest_path <- file.path(user_font_dir, font)

    if (file.exists(src_path)) {
      file.copy(src_path, dest_path, overwrite = TRUE)
      fonts_installed <- fonts_installed + 1
      message("Installed: ", font)
    } else {
      warning("Font file not found: ", src_path)
    }
  }

  # Refresh font cache on Linux
  if (Sys.info()["sysname"] == "Linux") {
    system("fc-cache -f -v")
  }

  if (fonts_installed > 0) {
    message("Successfully installed ", fonts_installed, " fonts to ", user_font_dir)
  } else {
    stop("No fonts were installed. Please check that the package was installed correctly.")
  }
}
