function raiz = gauss(A, b)
  n = length(A);
  Ab = [A b];
  for k = 1:n - 1 
    % pivotamento
    v = Ab(k:n,k);    
    [m,pos] = max(abs(v));
    aux = Ab(k,:);
    Ab(k,:) = Ab(pos + (k - 1),:);
    Ab(pos + (k - 1),:) = aux;
    Ab    
    % eliminação
    for i = k + 1:n
      razao = Ab(i,k)/Ab(k,k);
      for j = 1:n + 1
        Ab(i,j) += (-1)*Ab(k,j)*razao;
      endfor
    endfor
  endfor
  Ab
  % sistema triangular
  A = Ab(:,1:n)
  b = Ab(:,n + 1)
  for i = n:-1:1
    soma = 0;
    for k = i + 1:n
      soma += A(i,k)*raiz(k);
    endfor
    raiz(i) = (b(i) + (-1)*soma)/A(i,i);
  endfor  
