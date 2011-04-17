#include <R.h>
#include <Rdefines.h>    
#include <unicode/normlzr.h>

extern "C" SEXP normalize(SEXP strs, SEXP type, SEXP ctype) {
  const int n = LENGTH(strs);
  const char* charEncoding = CHAR(STRING_ELT(ctype, 0));
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
  }
  
  for (int i = 0; i < n; i++) {
    icu::UnicodeString src(CHAR(STRING_ELT(strs, i)), charEncoding);
    icu::UnicodeString dst;
    UErrorCode status;
    icu::Normalizer::normalize(src, unmode, 0, dst, status);
    
    if (U_FAILURE(status)) {
      printf("Warnings: %s\n", u_errorName(status));
    }
    
    int32_t len = dst.extract(0, dst.length(), NULL, charEncoding);
    char buf[len + 1];
    dst.extract(0, dst.length(), buf, "utf-8");

    SET_STRING_ELT(ret, i, mkChar(buf));
  }

  UNPROTECT(1);
  
  //return(R_NilValue);
  return(ret);
}
