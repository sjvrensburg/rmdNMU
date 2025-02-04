.onLoad <- function(libname, pkgname) {
  # Check if fonts are installed
  if (!font_check()) {
    message("Required fonts are not installed. Run install_fonts() to install them.")
  }
}

# Font checking function
font_check <- function() {
  # Basic check for Nunito Sans presence
  if (.Platform$OS.type == "windows") {
    fonts_dir <- file.path(Sys.getenv("LOCALAPPDATA"), "Microsoft", "Windows", "Fonts")
    return(any(grepl("NunitoSans", list.files(fonts_dir))))
  } else if (Sys.info()["sysname"] == "Darwin") {
    fonts_dir <- "~/Library/Fonts"
    return(any(grepl("NunitoSans", list.files(fonts_dir))))
  } else {
    # Linux
    return(system("fc-list | grep -i 'Nunito Sans'", ignore.stdout = TRUE) == 0)
  }
}
