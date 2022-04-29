function vLU = decompLU (n, A)
  for t = 1:n - 1
    v_det(t) = det(A(1:t, 1:t))
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
