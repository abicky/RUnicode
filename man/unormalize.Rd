\name{unormalize}
\alias{unormalize}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Normalize Unicode characters
}
\description{
Normalize Unicode characters of a character vector or factor using ICU library
}
\usage{
unormalize(x, form = c("NFKC", "NFC", "NFKD", "NFD"), encoding = "utf8")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
    a character vector or factor
}
  \item{form}{
    Unicode normalization form, one of "NFD", "NFKD", "NFC", and "NFKC" (Default is "NFKC")
}
  \item{encoding}{
    character encoding of `x` (Default is "utf8")
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
  a normalized character vector or factor whose levels are normalized
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
x <- c("\uff71\uff72\uff73", "\uff11\uff12\uff13")
x
unormalize(x, "NFKC")

ga <- "\u304c"
ga
charToRaw(ga)
charToRaw(unormalize(ga, "NFD"))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
