unormalize <- function(x, form = c("NFKC", "NFC", "NFKD", "NFD"), encoding = "utf8") {
    form <- switch(match.arg(form), NFD = 0L, NFKD = 1L, NFC = 2L, NFKC = 3L)
    if (class(x) == "character") {
        return(.Call("normalize", x, form, encoding))
    } else if (class(x) == "factor") {
        levels(x) <- .Call("normalize", levels(x), form, encoding)
        return(x)
    } else {
        stop("`x` should be either 'character' or 'factor'!")
    }
}
