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
