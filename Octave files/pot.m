% potência
function potencia = pot(b, e)
  res = 1;
  for i = 1:1:e
    res *= b;
  endfor
  potencia = res;
