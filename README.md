# Sistema de Gerenciamento de Biblioteca

## 📚 Sobre o Projeto
Este é um sistema de gerenciamento de biblioteca desenvolvido em Ruby on Rails. O sistema permite o controle de livros, autores, usuários e aluguéis, facilitando a administração de uma biblioteca.

## 🚀 Funcionalidades
- Cadastro e gerenciamento de usuários
- Cadastro e gerenciamento de autores
- Cadastro e gerenciamento de livros
- Sistema de aluguel de livros
- Interface intuitiva e responsiva

## 🛠️ Tecnologias Utilizadas
- Ruby on Rails
- PostgreSQL
- HTML/CSS
- JavaScript
- Bootstrap

## 📋 Pré-requisitos
- Ruby 3.0.0 ou superior
- Rails 7.0.0 ou superior
- PostgreSQL
- Node.js
- Yarn

## 🔧 Instalação

1. Clone o repositório:
```bash
git clone [URL_DO_REPOSITÓRIO]
```

2. Entre no diretório do projeto:
```bash
cd biblioteca
```

3. Instale as dependências:
```bash
bundle install
```

4. Configure o banco de dados:
```bash
rails db:create
rails db:migrate
```

5. Inicie o servidor:
```bash
rails server
```

## 📦 Estrutura do Projeto

### Modelos

#### Usuario
- **Descrição**: Gerencia os usuários da biblioteca
- **Atributos**:
  - `nome`: string (obrigatório)
  - `email`: string (obrigatório, único)
  - `telefone`: string (obrigatório)
- **Relacionamentos**:
  - `has_many :alugueis`
- **Validações**:
  - Presença de nome, email e telefone
  - Unicidade de email

#### Autor
- **Descrição**: Gerencia os autores dos livros
- **Atributos**:
  - `nome`: string (obrigatório)
- **Relacionamentos**:
  - `has_many :livros`
- **Validações**:
  - Presença de nome

#### Livro
- **Descrição**: Gerencia os livros da biblioteca
- **Atributos**:
  - `nome`: string (obrigatório)
  - `descricao`: text (obrigatório)
  - `autor_id`: integer (obrigatório)
- **Relacionamentos**:
  - `belongs_to :autor`
  - `has_many :alugueis`
- **Validações**:
  - Presença de nome, descrição e autor_id

#### Aluguel
- **Descrição**: Gerencia os aluguéis de livros
- **Atributos**:
  - `usuario_id`: integer (obrigatório)
  - `livro_id`: integer (obrigatório)
  - `data_inicial`: date (obrigatório)
  - `data_entrega`: date (obrigatório)
- **Relacionamentos**:
  - `belongs_to :usuario`
  - `belongs_to :livro`
- **Validações**:
  - Presença de data_inicial e data_entrega

### Controllers

#### UsuariosController
- **Ações**:
  - `index`: Lista todos os usuários
  - `show`: Mostra detalhes de um usuário
  - `new`: Formulário para novo usuário
  - `create`: Cria novo usuário
  - `edit`: Formulário para editar usuário
  - `update`: Atualiza usuário
  - `destroy`: Remove usuário

#### AutorsController
- **Ações**:
  - `index`: Lista todos os autores
  - `show`: Mostra detalhes de um autor
  - `new`: Formulário para novo autor
  - `create`: Cria novo autor
  - `edit`: Formulário para editar autor
  - `update`: Atualiza autor
  - `destroy`: Remove autor

#### LivrosController
- **Ações**:
  - `index`: Lista todos os livros
  - `show`: Mostra detalhes de um livro
  - `new`: Formulário para novo livro
  - `create`: Cria novo livro
  - `edit`: Formulário para editar livro
  - `update`: Atualiza livro
  - `destroy`: Remove livro

#### AluguelsController
- **Ações**:
  - `index`: Lista todos os aluguéis
  - `show`: Mostra detalhes de um aluguel
  - `new`: Formulário para novo aluguel
  - `create`: Cria novo aluguel
  - `edit`: Formulário para editar aluguel
  - `update`: Atualiza aluguel
  - `destroy`: Remove aluguel

## 📊 Diagramas

### Diagrama de Classes
```
[Usuario] 1 ---- * [Aluguel] * ---- 1 [Livro] * ---- 1 [Autor]
```

### Diagrama de Entidade-Relacionamento (ER)
```
+------------+       +------------+       +------------+
|   Usuario  |       |   Aluguel  |       |   Livro    |
+------------+       +------------+       +------------+
| id         |       | id         |       | id         |
| nome       |       | usuario_id |------>| nome       |
| email      |       | livro_id   |<------| descricao  |
| telefone   |       | data_inicial|      | autor_id   |
+------------+       | data_entrega|      +------------+
       ^             +------------+             ^
       |                    ^                   |
       |                    |                   |
       +--------------------+-------------------+
```

### Fluxograma do Sistema
```
[Início]
   ↓
[Menu Principal]
   ├── [Usuários]
   │   ├── [Cadastrar]
   │   │   └── [Validar Dados] → [Salvar] → [Listar]
   │   ├── [Listar]
   │   ├── [Editar]
   │   │   └── [Validar Dados] → [Atualizar] → [Listar]
   │   └── [Excluir]
   │       └── [Confirmar] → [Remover] → [Listar]
   │
   ├── [Autores]
   │   ├── [Cadastrar]
   │   │   └── [Validar Nome] → [Salvar] → [Listar]
   │   ├── [Listar]
   │   ├── [Editar]
   │   │   └── [Validar Nome] → [Atualizar] → [Listar]
   │   └── [Excluir]
   │       └── [Confirmar] → [Remover] → [Listar]
   │
   ├── [Livros]
   │   ├── [Cadastrar]
   │   │   └── [Validar Dados] → [Selecionar Autor] → [Salvar] → [Listar]
   │   ├── [Listar]
   │   ├── [Editar]
   │   │   └── [Validar Dados] → [Atualizar] → [Listar]
   │   └── [Excluir]
   │       └── [Confirmar] → [Remover] → [Listar]
   │
   └── [Aluguéis]
       ├── [Novo Aluguel]
       │   └── [Selecionar Usuário] → [Selecionar Livro] → [Definir Datas] → [Salvar] → [Listar]
       ├── [Listar]
       ├── [Editar]
       │   └── [Atualizar Datas] → [Salvar] → [Listar]
       └── [Excluir]
           └── [Confirmar] → [Remover] → [Listar]
```

## 🔄 Fluxo de Funcionamento

### 1. Cadastro de Usuários
- Adicionar novos usuários com nome, email e telefone
- Validar email único
- Listar todos os usuários cadastrados
- Editar informações de usuários existentes
- Excluir usuários

### 2. Cadastro de Autores
- Adicionar novos autores com nome
- Validar nome obrigatório
- Listar todos os autores cadastrados
- Editar informações de autores existentes
- Excluir autores

### 3. Cadastro de Livros
- Adicionar novos livros com nome, descrição e autor
- Validar campos obrigatórios
- Selecionar autor existente
- Listar todos os livros cadastrados
- Editar informações de livros existentes
- Excluir livros

### 4. Sistema de Aluguéis
- Criar novo aluguel selecionando usuário e livro
- Definir data inicial e data de entrega
- Validar datas
- Listar todos os aluguéis
- Editar informações de aluguéis existentes
- Excluir aluguéis

## 📝 Aprendizados
Durante o desenvolvimento deste projeto, foram adquiridos conhecimentos em:
- Desenvolvimento com Ruby on Rails
- Modelagem de banco de dados
- Relacionamentos entre modelos
- Validações de dados
- Interface com usuário
- CRUD completo
- Gerenciamento de dependências
- Versionamento com Git

## 🔒 Segurança
- Validação de dados em todos os formulários
- Proteção contra SQL Injection
- Validação de unicidade de email
- Validação de datas em aluguéis
- Proteção CSRF em todos os formulários

## 🧪 Testes
Para executar os testes do projeto:
```bash
rails test
```



## 📄 Licença
Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.


