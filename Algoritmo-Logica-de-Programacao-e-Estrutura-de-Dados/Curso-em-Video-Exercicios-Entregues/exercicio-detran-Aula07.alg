algoritmo "CalculoIdade"

var
   ano, nasc, idade: Inteiro
inicio
Escreval("----------------------------")
Escreval("DEPARTAMENTO DE TR�NSITO")
Escreval("----------------------------")
Escreva("Ano atual (yyyy): ")
Leia(ano)
Escreva("Ano de Nascimento (yyyy): ")
Leia(nasc)
idade <- ano - nasc
Escreval("----------STATUS----------")
Escreval("IDADE:", idade, " ANOS")
Se (idade >= 18) entao
   Escreval("APTO A TIRAR CARTEIRA")
senao
   Escreval("INAPTO A TIRAR CARTEIRA")
FimSe
Escreval("---------------------------")
fimalgoritmo
