function raiz = decompLU (A, b) 
  if ~verificaLU(A)
    display("Matriz A NÃO PODE ser decomposta em LU")
  else
    display("Matriz A PODE ser decomposta em LU")
    n = length(A);                
    U = zeros(n); % Inicializa U
    L = eye(n); % Inicializa L
    % Decomposição de A em LU 
    for i = 1:n
      for j = 1:n
        if j >= i
          soma1 = 0;
          for k = 1:i - 1
            soma1 += (L(i,k))*(U(k,j));
          endfor
          U(i,j) = A(i,j) + (-1)*soma1;
        else
          soma2 = 0;
          for k = 1:j - 1
            soma2 += (L(i,k))*(U(k,j));
          endfor
          L(i,j) = (A(i,j) + (-1)*soma2)/(U(j,j));
        endif      
      endfor
    endfor
    U
    L
    % Resolução dos sistemas triangulares
    % Sistema triangular inferior (Ly = b)
    for i = 1:n
      soma3 = 0;
      for k = 1:i - 1
        soma3 += (L(i,k))*(y(k));
      endfor
      y(i) = b(i) + (-1)*soma3;
    endfor
    % Sistema triangular superior (Ux = y)
    for i = n:-1:1
      soma4 = 0;
      for k = i + 1:n
        soma4 += (U(i,k))*(x(k));
      endfor
      x(i) = (y(i) + (-1)*soma4)/(U(i,i));
    endfor
    display("Raizes:");
    raiz = x;
  endif    

function vLU = verificaLU (A)
  n = length(A);
  for t = 1:n - 1
    v_det(t) = det(A(1:t,1:t));
  endfor
  cont = 0;
  for i = 1:n - 1
    if v_det(i) == 0
      cont += 1;
      vLU = false;
      break
    endif
  endfor
  if cont == 0
    vLU = true;
  endif
