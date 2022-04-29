% fatorial
function fatorial = fat(n)
  res = 1;
  for i = n:-1:1
    res *= i;
  endfor
  fatorial = res;
