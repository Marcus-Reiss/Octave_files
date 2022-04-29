% erro
function err = erro(xk, xkm1)
  err = abs(xkm1 - xk)/max(1, abs(xkm1));
  