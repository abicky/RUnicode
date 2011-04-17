unormalize <-
function(strs, type = c("NFKC", "NFC", "NFKD", "NFD"), ctype = "utf8") {
    type <- match.arg(type)
    type <- switch(type, NFD = 0, NFKD = 1, NFC = 2, NFKC = 3)
    if (class(strs) == "character") {
        .Call("normalize", strs, as.integer(type), ctype)
    } else if (class(strs) == "factor") {
        levels(strs) <- .Call("normalize", levels(strs), as.integer(type), ctype)
        strs
    } else {
        stop("The fist argument should be either 'character' or 'factor'!")
    }
}

