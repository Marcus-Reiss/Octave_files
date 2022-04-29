% iteração linear
function itl = iteralin(xk, erromax)
  i = 0;
  while true
    i++;
    xkm1 = phi(xk);
    err = erro(xk, xkm1);
    verro(i) = err;
    if err < erromax
      break    
    endif
    xk = xkm1;
  endwhile
  itl = xkm1;
  str = disp("erros:")
  verro'  
  str = disp("ordens:")
  ordem(verro)'
  