\name{unormalize}
\alias{unormalize}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Normalize unicode characters
}
\description{
normalize unicode characters
}
\usage{
unormalize(strs, type = c("NFKC", "NFC", "NFKD", "NFD"), ctype = "utf8")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{strs}{
    a character vector or factor
}
  \item{type}{
    unicode normalization form. one of "NFD", "NFKD", "NFC", and "NFKC". default is "NFKC".
}
  \item{ctype}{
    character encoding of 'strs'. default is "utf8".
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
        unormalize(c("アイウエオ", "ｱｲｳｴｵ"))
        # "アイウエオ" "アイウエオ"

        unormalize(c("アイウエオ", "ｱｲｳｴｵ"), "NFD")
        # "アイウエオ" "ｱｲｳｴｵ"
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
