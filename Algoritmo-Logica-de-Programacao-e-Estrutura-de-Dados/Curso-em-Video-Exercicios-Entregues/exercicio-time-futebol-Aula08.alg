algoritmo "TimeFutebol"

var
TimeA, TimeB, gols, diferenca: Inteiro
status: Caractere
inicio
EscrevaL("---------------------------")
EscrevaL("---FLAMENGO X FLUMINENSE---")
EscrevaL("---------------------------")
Escreva("Quantos gols do Flamengo? ")
Leia(TimeA)
Escreva("Quantos gols do Fluminense? ")
Leia(TimeB)
gols <- TimeA - TimeB
Se (gols >= 1) e (gols <= 2) entao
   status <- ("Vitória")
senao
   se (gols >= 3) e (gols <=4) entao
      status <- ("Goleada")
   senao
      se (gols >=5) entao
         status <- ("Foi para casa chorar no chuveiro ;-;")
      FimSe
   FimSe
FimSe
EscrevaL("---------------------------")
EscrevaL("Diferença: ", gols)
EscrevaL("Status: ", status)
EscrevaL("---------------------------")
fimalgoritmo
