algoritmo "CalculoIdade"

var
   NotaA, NotaB, M: Real
inicio
Escreval("----------------------------")
Escreval("ESCOLA APRENDENDO A PROGRAMAR")
Escreval("----------------------------")
Escreva("Primeira Nota: ")
Leia(NotaA)
Escreva("Segunda Nota: ")
Leia(NotaB)
M <- NotaA / NotaB
Escreval("----------M�dia----------")
Escreval("M�dia: ", M)
Se (M >= 7) entao
   Escreval("ALUNO APROVADO")
senao
   Escreval("ALUNO REPROVADO")
FimSe
Escreval("---------------------------")
fimalgoritmo
