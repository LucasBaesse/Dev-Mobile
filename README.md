# Dev-Mobile

O projeto MVC e composto pro 5 arquivos que interagem entre si para repartir as funçoes;

controllers.dart e responvavel conter alguns metodos relacionados a operacoes de manipulaçoes de dados tais como 
GetDta coleta dados, update atualiza e salva os dados para o repositorio, creat adiciona dados para o repositorio

repository.dart contem alguns metodo que coletam o Path do arquivo .json e alguns metodos que serao utilizados em 
para a persistencia de dados, como ReadData para leitura de dados do arquivo .json e SaveData responsavel por salvar os dados no mesmo arquivo. 

models.dart contem a estrutura dos dados que estarei manipulando. 

views.dart arquivo que contem as partes graficas que o aplicativo utiliza, e importante ressaltar que utilizei na minha aplicacao do views no main. dart devido uma limitacao. 
