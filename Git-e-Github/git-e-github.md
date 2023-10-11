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

<h2>Como desfazer alterações das quais não vamos precisar mais?</h2>

<p>Desfazer alterações antes de adicioná-las;</p> 
<p>Depois de adicioná-las, mas antes de commitá-las;</p> 
<p>após realizar o commit;</p>

Respectivamente:

```
git checkout
git reset
git revert
```

<p>Com o git checkout nós desfazemos uma alteração que ainda não foi adicionada ao index ou stage, ou seja, antes do git add. Depois de adicionar com git add, para desfazer uma alteração, precisamos tirá-la deste estado, com git reset. Agora, se já realizamos o commit, o comando git revert pode nos salvar.</p>

<h2>Armazenando temporariamente algumas de nossas alterações:</h2>

<p>Quando precisamos parar o desenvolvimento de algo no meio para trabalhar em outra coisa, utilizamos o:</p>

```
git stash
```
<p>Quando precisamos pausar o desenvolvimento de alguma funcionalidade, ou correção, antes de finalizar, talvez não seja interessante realizar um commit, pois o nosso código pode não estar funcionando ainda. Nesse caso é interessante salvar o trabalho para podermos voltar a ele depois.</p>

<h2>Exibindo as mudanças com o diff:</h2>

<p>Com o comando git diff, visualizamos as mudanças realizadas em determinado código. Podemos ver as diferenças entre commits, branches, etc.</p>

Assim o ```git diff``` exibe as mudanças:

```
+ linha adicionada
- linha removida
- linha modificada (versão antiga)
+ linha modificada (nova versão)
```

<p>O sinal de subtração (-) antes da linha indica que ela não está mais presente no arquivo. Já o sinal de adição (+) mostra que é uma linha nova. Alterações são representadas por uma remoção e uma adição de linha.</p>

<h2>Criando releases no GitHub e qual a diferença de Tag e Release:</h2>

<p>Tag e Release, embora sejam dois conceitos que estão relacionados entre si, eles não são iguais.</p>

<h3>Tag:</h3>

<p>Uma Tag no Git é uma referência estática a um ponto específico na história do seu repositório. Ela é usada para marcar commits importantes, como versões estáveis, marcos de desenvolvimento ou releases principais. Basicamente, uma Tag é uma forma de nomear um commit específico para que você possa referenciá-lo facilmente posteriormente.

As Tags são úteis para marcar pontos significativos na linha do tempo do seu projeto, permitindo que você recupere facilmente versões específicas do código no futuro. Elas são usadas principalmente para identificar versões estáveis do software, como v1.0, v2.0, etc. As Tags também podem ser anotadas, ou seja, você pode adicionar uma mensagem descritiva para fornecer mais informações sobre aquela versão específica.

Criamos tags no Git, via comando:</p>
```git tag```

<h3>Release:</h3>

<p>Uma Release no GitHub é uma versão específica do seu projeto que é disponibilizada para download ou deploy. É uma forma de empacotar um conjunto de arquivos do seu repositório em um formato que possa ser facilmente distribuído. Uma Release geralmente contém arquivos compilados, binários, documentação ou qualquer outra coisa necessária para distribuir seu software.

Ao criar uma Release no GitHub, você pode escolher quais commits, Tags ou branches deseja incluir no pacote. Isso permite que você selecione exatamente quais alterações ou versões do seu código fazem parte daquela Release específica. Cada Release geralmente possui um número de versão associado, como v1.0.0, v2.1.3, etc.</p>

<h2>Criando Releases no GitHub:</h2>

<p>Ao enviar uma tag para o GitHub, via comando git push, uma release não é criada automaticamente. Caso você queira criar uma release baseada em uma tag, deve fazer isso manualmente. A seguir um passo a passo de como realizar esse procedimento:</p>

<p>1) Acesse a página do seu repositório no GitHub e clique no link Tags:</p>

![1](https://github.com/thiiagolopes/estudos-frontend/assets/120226554/7859dbd0-8681-4869-8155-b5553ea65f46)

<p>2) Na página de listagem de tags, clique no botão Releases:</p>

![2](https://github.com/thiiagolopes/estudos-frontend/assets/120226554/1e65d926-4915-4188-b190-41b8125d7b11)

<p>3) Repare que o GitHub indica que não existem releases no repositório e exibe um botão para criar uma nova release. Clique nesse botão para abrir a página de criação de release, na qual você deve escolher a tag associada à nova release sendo criada, além de também poder preencher um título e uma descrição:</p>

![3](https://github.com/thiiagolopes/estudos-frontend/assets/120226554/d7d1e5e7-59ba-4690-b419-d40f4d1ce908)

<p>4) Pronto! Após isso a nova release será exibida na tela de releases:</p>

![4](https://github.com/thiiagolopes/estudos-frontend/assets/120226554/58ac0f72-ee9a-4b9e-bd7a-eb7cd18cd654)



