#' Install required fonts for rmdNMU templates
#' @export
install_fonts <- function() {
  font_dir <- ensure_fonts()
  message("Fonts have been installed to: ", font_dir)
  invisible(font_dir)
}
