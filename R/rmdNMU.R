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
#' * Fira Math (recommended for optimal math typography)
#'
#' To install Fira Math, run:
#' ```r
#' tinytex::tlmgr_install("firamath")
#' ```
#' If Fira Math is not available, the package will fall back to KpMath-Sans.
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
