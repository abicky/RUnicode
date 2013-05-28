#include <R.h>
#include <Rinternals.h>
#include <unicode/normlzr.h>

void _normalize(const char *str, char **buf, const char *encoding, UNormalizationMode unmode) {
  icu::UnicodeString src(str, encoding);
  icu::UnicodeString dst;
  UErrorCode status = U_ZERO_ERROR;
  icu::Normalizer::normalize(src, unmode, 0, dst, status);

  if (U_FAILURE(status)) {
    error(u_errorName(status));
  }

  int32_t len = dst.extract(0, dst.length(), NULL, encoding);
  *buf = (char *)malloc(len + 1);
  if (*buf == NULL) {
    error("Failed to allocate memory (%d bytes)", len + 1);
  }
  dst.extract(0, dst.length(), *buf, encoding);
}

extern "C" SEXP normalize(SEXP texts, SEXP type, SEXP ctype) {
  const int n = LENGTH(texts);
  const char* encoding = CHAR(STRING_ELT(ctype, 0));
  SEXP ret;
  PROTECT(ret = allocVector(STRSXP, n));

  UNormalizationMode unmode;
  switch(INTEGER(type)[0]) {
  case 0:
    unmode = UNORM_NFD;
    break;
  case 1:
    unmode = UNORM_NFKD;
    break;
  case 2:
    unmode = UNORM_NFC;
    break;
  case 3:
    unmode = UNORM_NFKC;
    break;
  default:
    error("Invalid Unicode form");
  }

  for (int i = 0; i < n; ++i) {
    char *buf;
    _normalize(CHAR(STRING_ELT(texts, i)), &buf, encoding, unmode);
    SET_STRING_ELT(ret, i, mkChar(buf));
    free(buf);
  }

  UNPROTECT(1);
  return(ret);
}
