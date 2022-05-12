function eigval = potencia(A, erromax, y)
  cont = 0;
  while true
    z = A*y;
    alpha = max(abs(z));
    y = z/alpha;
    z = A*y;
    lambda = z./y;
    if cont == 0
      y = z/alpha;
      auxlambda = lambda;
      cont++;
      continue
    endif
    verro = abs(lambda - auxlambda)./abs(lambda);
    [erro, pos] = min(verro);
    if erro < erromax
      break
    endif
    y = z/alpha;
    auxlambda = lambda;
  endwhile
  display("Autovetor associado:");
  y
  display("Maior autovalor:");
  eigval = lambda(pos);  
