#' Create HTML Slides with NMU Styling
#'
#' @param faculty Character string specifying the faculty theme. One of:
#'   "humanities", "education", "business", "sciences", "health",
#'   "engineering", "law", "ocean"
#' @param highlight String specifying the code highlighting style
#' @param ... Additional arguments passed to revealjs::revealjs_presentation
#'
#' @return R Markdown output format for HTML slides
#' @export
html_slides <- function(faculty = "sciences",
                        highlight = "tango",
                        ...) {

  # Validate faculty choice
  valid_faculties <- c("humanities", "education", "business", "sciences",
                       "health", "engineering", "law", "ocean")

  if (!faculty %in% valid_faculties) {
    stop("faculty must be one of: ", paste(valid_faculties, collapse = ", "))
  }

  # Get paths to resources
  css <- system.file("rmarkdown/templates/slides/resources/template.css",
                     package = "rmdNMU")

  logo <- system.file("rmarkdown/templates/slides/resources/logo.png",
                      package = "rmdNMU")

  # Custom header that includes the logo
  header <- system.file("rmarkdown/templates/slides/resources/header.html",
                        package = "rmdNMU")

  # Set up reveal.js options
  reveal_args <- list(
    theme = "white",
    highlight = highlight,
    center = TRUE,
    slide_number = TRUE,
    progress = TRUE,
    history = TRUE,
    self_contained = TRUE,
    css = css,
    includes = list(
      in_header = header
    ),
    reveal_plugins = c("notes", "search", "zoom"),
    reveal_options = list(
      slideNumber = TRUE,
      hash = TRUE,
      navigationMode = 'linear',
      controls = TRUE
    )
  )

  # Add any additional arguments
  reveal_args <- c(reveal_args, list(...))

  # Create a temporary file to store faculty choice
  faculty_file <- tempfile(fileext = ".txt")
  writeLines(faculty, faculty_file)

  # Add to pandoc args
  reveal_args$pandoc_args <- c(
    reveal_args$pandoc_args,
    c("--variable", paste0("faculty=", faculty)),
    c("--variable", paste0("logo=", logo))
  )

  # Call the base revealjs_presentation function
  do.call(revealjs::revealjs_presentation, reveal_args)
}
