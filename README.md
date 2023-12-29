# target_sistemas_prova_flutter

## Arquitetura
O projeto utiliza uma variação do padrão MVC (Model-View-Controller) com a adição do MobX como gerenciador de estado. Essa escolha permite uma organização modular e escalável, seguindo os princípios SOLID.

### Dependências Adicionais 
Além da implementação planejada do MobX, o projeto inclui a biblioteca Equatable para facilitar os testes unitários durante o desenvolvimento da lógica de parametrização do CRUD com shared preferences.

## Login
A autenticação é gerenciada pelo controlador MobX auth_controller.dart. A tela de login (login_screen.dart) interage com este controlador para autenticação do usuário.

### Fluxo de Autenticação
A tela de login se comunica com o controlador auth_controller.dart, que, por sua vez, interage com serviços de autenticação. O uso de MobX facilita a reatividade e atualizações instantâneas na interface do usuário em resposta às mudanças de estado.

-> Os dados de login estão mockados
* email = 'target@sistemas.com'
* password = 'target123'

## Tela principal / Home
Possui as validações solicitadas
