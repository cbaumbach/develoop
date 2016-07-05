required_packages <- c(
    "devtools",
    "Rcpp",
    "roxygen2",
    "testthat")

check_for_package <- function(package) {
    if (!requireNamespace(package, quietly = TRUE))
        stop("You need to install package '", package, "'.")
}

pr <- function(...) {
    cat(..., "\n", sep = "")
}

invisible(lapply(required_packages, check_for_package))

prompt <- "? "

development_loop <- function() {
    require(stats, quietly = TRUE)
    repeat {
        try(switch(command <- readline(prompt),
            b = devtools::build(),
            c = devtools::clean_dll(),
            ch = devtools::check(),
            d = devtools::document(),
            h = show_available_commands(),
            i = devtools::install(),
            l = devtools::load_all(),
            q = return(),
            t = devtools::test(),
            pr("unknown command: ", command)))
    }
}

show_available_commands <- function() {
    pr("b  build")
    pr("c  clean_dll")
    pr("ch check")
    pr("d  document")
    pr("h  help")
    pr("i  install")
    pr("l  load_all")
    pr("q  quit")
    pr("t  test")
}

development_loop()
