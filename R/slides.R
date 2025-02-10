#' Create HTML Slides with NMU Styling Using xaringan
#'
#' @param faculty Character string specifying the faculty theme. One of:
#'   "humanities", "education", "business", "sciences", "health",
#'   "engineering", "law", "ocean"
#' @param highlight String specifying the code highlighting style
#' @param ... Additional arguments passed to xaringan::moon_reader
#'
#' @return R Markdown output format for HTML slides
#' @export
html_slides <- function(faculty = "sciences",
                        highlight = "github",
                        ...) {
  # Validate faculty choice
  valid_faculties <- c(
    "humanities", "education", "business", "sciences",
    "health", "engineering", "law", "ocean"
  )

  if (!faculty %in% valid_faculties) {
    stop("faculty must be one of: ", paste(valid_faculties, collapse = ", "))
  }

  # Get resource paths
  pkg_resource_dir <- system.file("rmarkdown/templates/slides/resources",
    package = "rmdNMU"
  )

  # Create lib folder in working directory for assets
  lib_dir <- file.path("libs")
  if (!dir.exists(lib_dir)) {
    dir.create(lib_dir, recursive = TRUE)
  }

  # Copy logo to lib directory
  logo_source <- file.path(pkg_resource_dir, "logo.png")
  logo_dest <- file.path(lib_dir, "logo.png")
  file.copy(logo_source, logo_dest, overwrite = TRUE)

  # Base CSS files from the package
  css_files <- file.path(
    pkg_resource_dir,
    c(
      "nmu-theme.css",
      paste0("nmu-", faculty, ".css")
    )
  )

  # Create header content
  header_content <- '
<script>
var nmuInitialized = false;

function addNMULogos() {
  if (nmuInitialized) return;

  // Add logo to title slide (first slide)
  var firstSlide = document.querySelector(".remark-slides-area .remark-slide-container:first-child .remark-slide-content");
  if (firstSlide && !firstSlide.querySelector(".title-logo")) {
    var titleLogo = document.createElement("img");
    titleLogo.src = "libs/logo.png";
    titleLogo.className = "title-logo";
    firstSlide.insertBefore(titleLogo, firstSlide.firstChild);
    firstSlide.classList.add("title-slide");
  }

  // Add logo to non-title slides
  var slides = document.querySelectorAll(".remark-slide-content:not(.title-slide)");
  slides.forEach(function(slide) {
    if (!slide.querySelector(".slide-logo")) {
      var slideLogo = document.createElement("img");
      slideLogo.src = "libs/logo.png";
      slideLogo.className = "slide-logo";
      slide.appendChild(slideLogo);
    }
  });

  nmuInitialized = true;
}

// Wait for remark to be ready
var checkRemarkInterval = setInterval(function() {
  if (typeof slideshow !== "undefined") {
    clearInterval(checkRemarkInterval);

    // Add logos initially
    addNMULogos();

    // Add logos when slides change
    slideshow.on("afterShowSlide", addNMULogos);
    slideshow.on("afterPresentationMode", addNMULogos);
  }
}, 100);
</script>'

  # Write header content to temporary file
  header_file <- tempfile(fileext = ".html")
  writeLines(header_content, header_file)

  # Base arguments for xaringan
  args <- list(
    css = css_files,
    self_contained = FALSE,
    lib_dir = lib_dir,
    nature = list(
      ratio = "16:9",
      highlightStyle = highlight,
      highlightLines = TRUE,
      countIncrementalSlides = FALSE,
      navigation = list(
        scroll = FALSE,
        touch = TRUE,
        click = FALSE
      )
    ),
    includes = list(
      in_header = header_file
    )
  )

  # Add any additional arguments from ...
  dots <- list(...)
  if (length(dots) > 0) {
    args <- modifyList(args, dots)
  }

  # Call xaringan::moon_reader
  output_format <- do.call(xaringan::moon_reader, args)

  output_format
}
