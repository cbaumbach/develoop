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
    while (TRUE) {
        try(switch(command <- readline(prompt),
            c = devtools::clean_dll(),
            d = devtools::document(),
            h = show_available_commands(),
            l = devtools::load_all(),
            t = devtools::test(),
            q = return(),
            pr("unknown command: ", command)))
    }
}

show_available_commands <- function() {
    pr("c  clean_dll")
    pr("d  document")
    pr("l  load_all")
    pr("t  test")
    pr("h  help")
    pr("q  quit")
}

development_loop()
