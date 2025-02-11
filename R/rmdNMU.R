#' NMU R Markdown Templates
#'
#' @description
#' This package provides R Markdown templates for Nelson Mandela University's
#' Statistics Department. It includes templates for:
#' * Practicals and lab assignments
#' * Short lecture notes
#' * Tests and assignments
#'
#' @section Template Types:
#' The package provides three main templates:
#' * `html_prac()` and `pdf_prac()`: For practical assignments
#' * `short_notes()`: For creating lecture notes
#' * `tests()`: For creating tests and assignments
#'
#' @section Font Requirements:
#' The templates use the following fonts:
#' * Nunito Sans (included in package)
#' * Fira Math (installed automatically if needed via TinyTeX)
#'
#' The required LaTeX packages will be installed automatically when needed.
#' If not install Fira Math, run:
#' ```r
#' tinytex::tlmgr_install(c("firamath", "firamath-otf"))
#' ```
#'
#' @section Usage:
#' After installation, the templates will be available in RStudio's
#' New R Markdown dialogue box, or can be used programmatically with
#' `rmarkdown::draft()`.
#'
#' @docType package
#' @name rmdNMU
#' @keywords internal
"_PACKAGE"
