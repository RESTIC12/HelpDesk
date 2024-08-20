# HelpDesk

HelpDesk é um aplicativo desenvolvido por Victor Brigido, Joao Matheus, Ikaro, Gabriel Palhano, Larissa e Josimar como parte de um projeto de residência em desenvolvimento iOS. O aplicativo foi criado utilizando SwiftUI, com integração ao Firebase para gerenciar autenticação de usuários. O HelpDesk visa melhorar e facilitar a gestão de chamados dentro de uma empresa, proporcionando uma interface simples e eficiente para os usuários.

<img src="https://github.com/user-attachments/assets/4d6906a9-5d8a-44fc-ad55-746d8dc486f7" alt="image" width="300"/>

<img src="https://github.com/user-attachments/assets/31b3760d-87fe-43ad-b5b0-64ebfe9360fe" alt="image" width="300"/>


<img src="https://github.com/user-attachments/assets/e811fa2c-5a5b-4876-9534-72400e657c74" alt="image" width="300"/>

## Funcionalidades

- **Autenticação de Usuários:** Utilizando o Firebase Authentication, os usuários podem criar contas e fazer login de forma segura.
- **Gestão de Chamados:** Permite a criação, visualização e atualização de chamados de suporte dentro da empresa.
- **Notificações em Tempo Real:** Os usuários recebem notificações sobre atualizações nos chamados.
- **Interface Intuitiva:** Desenvolvida com SwiftUI, proporcionando uma experiência de usuário fluida e moderna.

## Tecnologias Utilizadas

- **SwiftUI:** Para a construção da interface do usuário.
- **Firebase Authentication:** Para autenticação e gerenciamento de usuários.
- **Combine:** Para gerenciamento de estados e bindings reativos.
- **URLSession:** Para fazer requisições HTTP e obter dados da API.

## Estrutura do Projeto

### `LoginView`

A tela de login permite que os usuários façam login ou criem uma nova conta. Utiliza o `SessionManager` para gerenciar a autenticação via Firebase. A `LoginView` alterna entre os modos de login e criação de conta com um Picker e exibe mensagens de status de login.

### `HomeView`

A `HomeView` é a tela principal do aplicativo, onde os usuários podem visualizar seus chamados abertos e criar novos chamados. Utiliza `ChamadoViewModel` para gerenciar os dados dos chamados.

### `NewChamadoView`

Permite aos usuários criar novos chamados, fornecendo detalhes como título, descrição, e anexos. Os dados são enviados e gerenciados por meio do `ChamadoService`.

### `ChamadoViewModel`

Um `ObservableObject` que gerencia o estado dos dados dos chamados. Realiza operações de CRUD(exceto Delete) utilizando o `ChamadoService` e armazena os chamados em um array acessível pela interface.

## Como Funciona

- **Autenticação:** Os usuários podem criar uma conta ou fazer login usando e-mail e senha.
- **Gestão de Chamados:** Após o login, os usuários podem criar e gerenciar chamados de suporte.
- **Notificações:** As notificações mantêm os usuários informados sobre o status de seus chamados.

## Como Rodar o Projeto

1. **Clone o Repositório:**
   ```bash
   git clone [URL_DO_REPOSITORIO]
2. **Instale as Dependências:**
  Firebase
3.**Abra o Projeto no Xcode:**
   ```bash
   open HelpDesk.xcodeproj
4.**Configure o Firebase:**
Adicione o arquivo GoogleService-Info.plist do seu projeto Firebase à pasta raiz do projeto no Xcode.
5.**Compile e execute:**
Selecione o dispositivo ou simulador desejado e clique em Run.

Conclusão

HelpDesk é um aplicativo robusto para gestão de chamados, desenvolvido para melhorar a eficiência operacional dentro de empresas. Este projeto foi educativo e desafiador para todos os envolvidos, proporcionando uma excelente oportunidade de aprendizado em tecnologias iOS.

Se tiverem qualquer dúvida ou feedback, sintam-se à vontade para abrir uma issue ou entrar em contato.




