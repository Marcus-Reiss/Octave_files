% seno
function seno = sen(x, n)
  sinal = 1;
  res = 0;
  for i = 1:2:n
    i
    res += sinal*pot(x, i)/fat(i)
    sinal *= -1;
  endfor
  seno = res;
