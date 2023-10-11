<h1>Criando um repositório através do Github.</h1>

<p>Há duas maneiras: 

Através do site/plataforma github, clicando no sinal de "+", no canto superior direito ou utilizando um link direto: repo.new</p>

<h2>Criando um repositório remoto:</h2>

1) Crie uma pasta nova em seu computador;

2) No terminal (ou Git Bash, no Windows) navegue até a pasta recém criada (utilize o comando cd para navegar entre pastas);

3) Execute o comando ```git init --bare```;

OBS: Não se esqueça do parâmetro --bare. Caso tenha executado o comando init sem esse parâmetro, execute na sequência o seguinte comando: ```git config core.bare true```.

4) Navegue até a pasta onde se encontra o seu projeto;

5) Execute o comando ```git remote add local {caminho}```. Substitua {caminho} pelo caminho completo da pasta recém criada;

6) Crie uma nova pasta em seu computador, para representar o trabalho de outra pessoa;

7) No terminal (ou Git Bash, no Windows) navegue até a pasta recém criada;

8) Execute o comando ```git clone {caminho} projeto```. Substitua {caminho} pelo caminho completo da pasta que criamos no primeiro passo;

9) Observe que o repositório clonado está vazio;

10) Acesse a pasta Projeto e execute o comando ```git remote rename origin local``` para renomear o repositório local da outra pessoa de "origin" para "local";

11) Navegue até a pasta onde se encontra o seu projeto original;

12) Execute o comando ```git push local master``` para enviar as suas modificações para o seu servidor;

13) Navegue até a pasta criada no passo 6;

14) Execute o comando ```git pull local master``` para baixar as modificações;

15) Abra o seu navegador e acesse http://github.com/;

16) Crie uma conta;

17) Crie um novo repositório, clicando no símbolo de adição no canto superior direito;

18) No terminal (ou Git Bash, no Windows) adicione, ao seu projeto inicial, o repositório remoto recém criado (os comandos são mostrados pelo próprio GitHub);

19) Execute ```git push origin main``` para enviar as suas alterações para o repositório no GitHub.


As vezes parece que temos 2 comandos que realizam as mesmas funções, porem cada um tem um motivo do porque existe, então vamos repassar alguns deles. 1) `git init` -> Inicia um repositório **local**, para podermos começar a guardar e versionar o nosso código. 2) `git clone` -> Realiza a cópia de um repositório **remoto** para uma pasta **local**, trazendo todo o histórico de mudanças, conhecidos como commits, e todos os arquivos **desde o inicio**. 3) `git remote add` -> Permite interligar um repositório **local** já existente a um repositório **remoto**, assim podemos começar a enviar mudanças e commits para esse repositório remoto com o `git push`. 4) `git push` -> Envia todas as alterações para o repositório remoto, isso inclui arquivos novos, mudanças em arquivos e até mensagens de commits. 5) `git pull` -> Traz todas as alterações que estão presentes no repositório remoto, e se diferencia do `git clone` pelo fato de não criar um novo repositório local que tem que trazer todo o conteúdo, trazendo **apenas as alterações** que o repositório local ainda não tem, acelerando o trabalho para repositórios muito grandes.

<h2>Criando uma pasta "invisível" para o Git</h2>

Caso queira criar um arquivo em que o git ignore, mesmo havendo mudanças, basta criar uma documentação pelo VS Code com o nome <strong>.gitignore</strong> e dentro dele citar o nome dos arquivos ou pastas que deve ignorar. Para pastas coloque "nome-da-pasta/", em arquivos, somente o nome do mesmo.

<h2>Qual a diferença de git merge e git rebase?</h2>

<p><li>o merge integra o conteúdo da branch de trabalho (por exemplo titulo ou lista) com a branch master. Nesse caso apenas a branch master é alterada para adicionar as mudanças e o histórico da branch de trabalho permanece inalterado e um novo commit dessa junção é adicionado ao histórico.</li></p>

<p><li>o rebase move a base da branch de trabalho para o final da branch master; ou seja, Nesse caso, o código também é integrado, porém ele faz isso transformando duas branches em uma só. Assim, a linha do tempo das alterações de código permanece sempre como uma linha contínua da branch master, apagando a branch de trabalho.</li></p>

O merge preserva o histórico "por extenso" e todos os commits feitos nas branches, e é possível consultar exatamente em que momento mudanças no código feitas através de branches de trabalho foram adicionadas à branch principal. Quando as branches são unidas usando rebase esse histórico não é preservado.

Em projetos complexos, algumas pessoas podem achar essas ramificações um pouco confusas. Porém, por outro lado, uma única linha contínua faz com que não seja possível identificar exatamente os pontos de modificação no código.

Traduzindo estes dois processos para um diagrama, teríamos o seguinte resultado:

```
// usando merge

* branch master
॰ commit "master1"
|
|
॰ commit "master2"
|\
| \
|  \ branch lista
|  ॰ commit "lista1"
|  |
|  |
|  ॰ commit "lista2"
|  |
|  |
|  ॰ commit "lista3"
| / 
॰ checkout master
| merge lista
|
branch master contém alterações feitas em lista
```

```
// usando rebase

* branch master
॰ commit "master1"
|
|
॰ commit "master2"
|
|
॰ checkout master
| rebase lista
|
branch master contém alterações feitas em lista
commits em master são preservados
histórico da branch lista não é preservado
```
<h3>Quando utilizar um ou outro?</h3>

Como sempre dizemos em programação, depende. Em geral, partimos das seguintes situações:

merge é mais indicado para trabalhos com branches compartilhadas, onde há várias pessoas envolvidas alterando diversas branches;
rebase é mais indicado para projetos pessoais, times pequenos ou projetos mais simples.
Em alguns casos específicos é possível usar o rebase mesmo em repositórios compartilhados, ou você pode preferir usar sempre merge mesmo trabalhando em um projeto pessoal privado. Ou seja, tudo depende do caso :) outros pontos a considerar:

<p><li>rebase pode ser útil para "limpar" linhas do tempo de repositórios que se tornaram muito poluídas pelo excesso de merging e branching;</li></p>

<p><li>Se você quer preservar o histórico completo do projeto, independente da complexidade, use sempre merge;</li></p>

<p><li>rebase pode facilitar a resolução de conflitos, porém pode também ser mais complicado voltar o código ao estágio anterior em caso de conflitos mais complexos.</li></p>
