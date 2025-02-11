.onLoad <- function(libname, pkgname) {
  if (tinytex::is_tinytex()) {
    pkgs <- c("unicode-math", "lete-sans-math")  # Only load unicode-math
    missing <- pkgs[!tinytex::check_installed(pkgs)]
    if (length(missing) > 0) {
      message("Installing required LaTeX packages...")
      tinytex::tlmgr_install(missing)
    }
  }
}
