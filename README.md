# CI&T - Mobile Test

Este é um pequeno aplicativo que busca as informações de um servidor meu e cria duas telas principais (uma de lista e uma de detalhes).

A API retorna locais para serem visitados na Cidade de São Paulo, como o Senac, Av. Paulista e Parque Ibirapuera.

---

## Rodando o projeto

1. Clone este repositório:
   ```bash
   git clone https://github.com/the1scient/ciandt.git
   ````
2. Abra o arquivo ciandt.xcodeproj no Xcode (normalmente, basta dar dois cliques ao usar o macOS).

3. No Xcode, selecione um Simulator (testei com o iPhone 16 normal) ou use seu iPhone.

4. Clique em Run (ou Cmd + R) para compilar e rodar o aplicativo.

## Arquitetura

Estou utilizando a arquitetura MVVM (Model-View-ViewModel). No MVVM consigo separar de forma simples as funcionalidades de cada "componente", além de ser possível escalar o código com facilidade no futuro.

## Bibliotecas/Frameworks

1. SwiftUI

Framework declarativo e "simples" que utilizei ao invés do UIKit.


2. Foundation

Utilizada para manipulação de tipos básicos do sistema e recursos como URLSession para requisições HTTP.


3. XCTest

Framework oficial de testes no iOS, utilizado tanto para testes unitários quanto para testes de UI.

4. URLSession

Classe nativa do iOS para realizar chamadas de rede assíncronas, utilizada pelo CityRepository para buscar os dados da API.

## Melhorias Futuras

1. Gostaria de melhorar o design do aplicativo, trazer cores que me agradem e ícones/imagens que tenham a ver com exploração, especialmente exploração urbana.

2. Na parte "técnica", acharia legal fazer um filtro/sort para organizar os locais de acordo com a distância/proximidade do usuário para com os locais. Ex: estou mais perto da Av. Paulista? A Av. Paulista estaria em 1º lugar na Lista.
