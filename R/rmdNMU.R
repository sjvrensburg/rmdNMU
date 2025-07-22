#' NMU R Markdown Templates
#'
#' @description
#' This package provides simplified R Markdown templates for Nelson Mandela University.
#' It includes three main template types with NMU branding and academic formatting.
#'
#' @section Template Types:
#' The package provides three consolidated templates:
#' * `nmu_document()`: For academic documents, notes, practicals, and lab reports
#' * `nmu_assessment()`: For tests, assignments, and exams with optional solutions
#' * `nmu_beamer()`: For presentations with faculty color themes
#'
#' @section Features:
#' * Self-contained templates with no external dependencies
#' * NMU branding with faculty color themes
#' * Mathematical notation and statistical symbols
#' * Code highlighting and theorem environments
#' * Professional academic formatting
#'
#' @section Font Requirements:
#' The templates use Nunito Sans font (included in package) and require XeLaTeX
#' for compilation. The following LaTeX packages are used:
#' * fontspec, unicode-math, amsmath, amssymb
#' * lete-sans-math for mathematical typography
#'
#' @section Usage:
#' Templates are available in RStudio's New R Markdown dialogue or can be used
#' programmatically:
#' ```r
#' rmarkdown::render("document.Rmd", nmu_document())
#' rmarkdown::render("test.Rmd", nmu_assessment(solutions = TRUE))
#' rmarkdown::render("slides.Rmd", nmu_beamer(theme = "sciences"))
#' ```
#'
#' @docType package
#' @name rmdNMU
#' @keywords internal
"_PACKAGE"
