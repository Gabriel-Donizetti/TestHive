# TestHive

Este projeto serviu como base de pesquisa para aprender a usar a biblioteca Hive
Para utilizarmos o Hive precisa-se instalar os pacotes - https://pub.dev/packages/hive.
E o pacote - https://pub.dev/packages/path_provider ou https://pub.dev/packages/path.  
Que serve para pegarmos o caminho até o DB local do aparelho.

# Para iniciar a utilização do Hive e Path

Primeiro deve-se entender que ao utilizar o DB local do aparelho uma das boas praticas na 
utilização do Hive é fazer com que tudo aconteça antes, assíncrono a execução do app
Fazendo assim a função main ser assíncrona - 
![image](https://user-images.githubusercontent.com/69644547/130245337-334294fa-2d9a-4b2c-a069-d0c7e770730a.png)

Depois de setado a função main utiliza-se a função - 

![image](https://user-images.githubusercontent.com/69644547/130266548-b549022b-a9f3-4737-a613-6a7f5c89b874.png)

Para guardar o path até a pasta onde será guardado as variaveis do app, depois para inicializar o Hive utiliza-se a seguinte função - 
![image](https://user-images.githubusercontent.com/69644547/130267356-1df304ec-9623-410d-9e5c-0c0318edd39f.png)

# Hive

O Hive utiliza um sistema de Box, que seria como uma table de SQL, para iniciarmos e chamarmos uma table usamos o seguinte comando Hive - ![image](https://user-images.githubusercontent.com/69644547/130485449-c5352415-5391-419f-b42d-f217405075d0.png)

Assim poderemos acessar os dados existentes dentra da table.

Para acessarmos os dados existentes na table usamos o comando - 
![image](https://user-images.githubusercontent.com/69644547/130485885-c7d6dc89-1ce2-4d1f-b16f-127380a23d33.png)

Hive.get é a função que permite acessar os dados de uma coluna da table 'settings' criada. Para adicionarmos um dado na table usa-se a seguinte função - ![image](https://user-images.githubusercontent.com/69644547/130486624-0d068729-f6f1-4ce0-9c7e-91a907777bc2.png)

Abrindo a table settings com a função openBox, com o método Hive.put passamos os parametros a serem adicionados an table - ![image](https://user-images.githubusercontent.com/69644547/130486801-57edc7e7-3ad6-47e6-851d-5eec721c4489.png)

E depois na var/coluna que deser ser adicionada


