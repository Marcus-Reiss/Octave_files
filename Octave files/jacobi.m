% jacobi-richardson
function vraiz = jacobi(xk, A, b, erromax)
  Ab = novA(A, b);
  cl = crit_linhas(Ab(1:3, :));
  cc = crit_colunas(Ab(1:3, :));
  conv = converg(cl, cc);
  if ~conv 
    vraiz = "diverge";
  else
    "converge"
    i = 0;
    while true
      i++;
      xkm1(1) = (-1)*Ab(1, 2)*xk(2) + (-1)*Ab(1, 3)*xk(3) + Ab(4, 1);
      xkm1(2) = (-1)*Ab(2, 1)*xk(1) + (-1)*Ab(2, 3)*xk(3) + Ab(4, 2);
      xkm1(3) = (-1)*Ab(3, 1)*xk(1) + (-1)*Ab(3, 2)*xk(2) + Ab(4, 3);
      err = erro(xk, xkm1);
      verro(i) = err;
      if err < erromax
        break
      endif
      for k = 1:3
        xk(k) = xkm1(k);
      endfor
    endwhile
    for k = 1:3
      vraiz(k) = xkm1(k);
    endfor
    verro
  endif
  
function newA = novA(A, b)  
    for i = 1:3
      for j = 1:3
        nA(i, j) = A(i, j)/A(i, i);        
      endfor
      nb(i) = b(i)/A(i, i);
    endfor
    newA = [nA; nb];

function cl = crit_linhas(nA)
  li = zeros(1, 3); % initializing
  for i = 1:3
    for j = 1:3
      if j ~= i
        li(i) += abs(nA(i, j));
      endif
    endfor
  endfor
  cl = max(li);
  
function cc = crit_colunas(nA)
  co = zeros(1, 3); % initializing
  for j = 1:3
    for i = 1:3
      if i ~= j
        co(j) += abs(nA(i, j));
      endif
    endfor
  endfor
  cc = max(co);

function conv = converg(cl, cc)
  if cl < 1 || cc < 1
    conv = true;    
  else
    conv = false;
  endif
  
function err = erro(xk, xkm1)
  for i = 1:3
    dife = abs(xkm1(i) - xk(i));
  endfor
  num = max(dife);
  den = max(abs(xkm1));
  err = num/den;
  
  
  
  
  
  
