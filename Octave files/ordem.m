% ordem de convergência
function ord = ordem(verro)
  for i = 2:1:length(verro) - 1
    ord(i - 1) = log(abs(verro(i + 1)/verro(i)))/log(abs(verro(i)/verro(i - 1)));    
  endfor  
  