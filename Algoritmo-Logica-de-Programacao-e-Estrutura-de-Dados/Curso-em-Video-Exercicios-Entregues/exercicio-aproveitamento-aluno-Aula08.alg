algoritmo "AproveitamentoAluno"

var
NotaA, NotaB, M, Aprov: Real
NotaC: Caractere
inicio
EscrevaL("-----------------------------")
EscrevaL("Escola Aprendendo a Programar")
EscrevaL("-----------------------------")
Escreva("Primeira Nota: ")
Leia(NotaA)
Escreva("Segunda Nota: ")
Leia(NotaB)
M <- (NotaA + NotaB) /2
Aprov <- M
Se (Aprov >= 9) e (Aprov <= 10) entao
   NotaC <- ("A")
   senao
        se (Aprov >= 8) e (Aprov <= 8.9) entao
      NotaC <- ("B")
      senao
           se (Aprov>= 7) e (Aprov<= 7.9) entao
           NotaC <- ("C")
           senao
                se (Aprov >= 6) e (Aprov<= 6.9) entao
                NotaC <- ("D")
                senao
                     se (Aprov >= 5) e (Aprov <= 5.9) entao
                     NotaC <- ("E")
                     senao
                          NotaC <- ("F")
                     FimSE
                FimSe
           FimSe
      FimSE
   FimSe
EscrevaL("-----------------------------")
EscrevaL("Média: ", M)
EscrevaL("Aproveitamento: ", NotaC)
EscrevaL("-----------------------------")

fimalgoritmo
