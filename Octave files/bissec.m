% método da bisseção
function bissecao = bissec(a, b, erromax)
    i = 0
  while true
    i++;
    xk = (a + b)/2;
    err = erro(a, b)
    fxk = f(xk);
    if fxk == 0
      break    
    elseif err < erromax
      break
    elseif fxk*f(a) < 0
      b = xk;
    else 
      a = xk;
    endif
  endwhile
  iteracoes = i
  bissecao = xk;
  