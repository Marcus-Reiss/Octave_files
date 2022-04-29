% método de newton
function raiz = newton(xk, erromax)
  i = 0;
  while true
    i++;
    xkm1 = xk - f(xk)/dif(xk);
    err = erro(xk, xkm1);
    verro(i) = err;
    if err < erromax
      break
    endif
    xk = xkm1;
  endwhile
  raiz = xkm1;
  str = disp("erros:")
  verro'
  str = disp("ordens:")
  ordem(verro)'  
