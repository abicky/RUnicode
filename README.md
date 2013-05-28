RUnicode -- Normalize Unicode characters
========================================

Description
-----------

Normalize Unicode characters of a character vector or factor using ICU library.
Currently, Windows is not supported.

Install
-------

Firstly, install ICU library and make sure that you can execute `icu-config --version`.

#### Mac OS X

    $ brew install icu4c
    $ brew link icu4c --force

#### Debian

    $ sudo aptitude install libicu-dev

#### CentOS

    $ sudo yum install libicu-devel


Next, clone the repository and install the package.

    $ git clone git@github.com:abicky/RUnicode.git
    $ R CMD INSTALL RUnicode


Usage
-----

    unormalize(x, form = c("NFKC", "NFC", "NFKD", "NFD"), encoding = "utf8")

See also `?unormalize`


Examples
--------

    > x <- c("\uff71\uff72\uff73", "\uff11\uff12\uff13")
    > x
    [1] "ｱｲｳ"    "１２３"
    > unormalize(x, "NFKC")
    [1] "アイウ" "123"   
    > ga <- "\u304c"
    > ga
    [1] "が"
    > charToRaw(ga)
    [1] e3 81 8c
    > charToRaw(unormalize(ga, "NFD"))
    [1] e3 81 8b e3 82 99
