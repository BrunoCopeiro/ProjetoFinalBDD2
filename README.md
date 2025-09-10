# 🏢 Sistema de Gestão de Espaço de Coworking - WorkHub

Este projeto propõe o desenvolvimento de um banco de dados completo para um espaço de coworking, com funcionalidades essenciais como controle de membros, reservas, planos de assinatura, check-ins, pagamentos e permissões de acesso por usuário.

---

## 👥 Integrantes

Bruno De Lima Santos
Eduardo Kruger Da Silva De Souza
Henrique Dos Santos Oliveira


---

## 💡 Visão Geral do Projeto

A rede **WorkHub** oferece estações compartilhadas, salas de reunião e escritórios privativos. Este sistema de banco de dados foi desenvolvido com o objetivo de:

- Cadastrar e gerenciar usuários com diferentes cargos (administrador, gerente, membro)
- Criar planos de assinatura com número de acessos mensais
- Controlar reservas de espaços com status, horários e registros de presença
- Gerenciar pagamentos com valores, datas e métodos
- Oferecer consultas úteis para análise do uso do espaço

---

## 📁 Estrutura do Projeto

├── coworking.sql        # Script DDL + DML inicial (criação e população do banco)
├── queries/
│   ├── crud.sql         # Consultas CRUD (Membros, Reservas, Planos e Pagamentos)
│   ├── advanced.sql     # Consultas avançadas (JOIN, GROUP BY, HAVING, UNION, etc.)
├── backups/
│   └── backup.sql       # Dump MySQL do banco
└── README.md            # Documentação

## Tecnologias

- MySQL 8.0+
- SQL (DDL, DML, consultas avançadas)

## Testes Pedidos 

1. Diagrama ER exportado de ferramenta à sua escolha
2. script DDL completo
3. script de população inicial - DML
4. queries/crud_*.sql contendo operações CRUD
5. queries/advanced.sql com consultas avançadas
6. backups/ com dump MySQL e instruções de restore

# 1. Diagrama ER exportado de ferramenta à sua escolha

![ER](https://github.com/user-attachments/assets/2302caf1-e1d5-4063-a284-102be8ca92d1)


# 2. script DDL completo
# 3. script de população inicial - DML

Anexado ao projeto SQL.

# 4. queries/crud_*.sql contendo operações CRUD 
<img width="676" height="350" alt="crud mebros" src="https://github.com/user-attachments/assets/293938a5-69e7-4982-91c1-264596b9c436" />
<img width="685" height="370" alt="crud membros" src="https://github.com/user-attachments/assets/8b91f9a5-ff72-4492-bee6-0a66af428997" />
<img width="834" height="472" alt="crud pagamentos" src="https://github.com/user-attachments/assets/c12a09dc-5eb7-49cb-b496-f5799a6c3880" />
<img width="662" height="486" alt="crud planos" src="https://github.com/user-attachments/assets/27474327-5c60-493e-a235-9e772088c6e3" />
<img width="837" height="497" alt="crud reservas" src="https://github.com/user-attachments/assets/a08332ad-6b37-44a7-85be-902f5cabf874" />


# 5. queries/advanced.sql com consultas avançadas

<img width="641" height="317" alt="consultas avan 1" src="https://github.com/user-attachments/assets/9f6627c0-1444-4000-9d89-913acf552c11" />
<img width="616" height="354" alt="consultas avan 3" src="https://github.com/user-attachments/assets/0745a713-a765-49a7-87e5-fc337d96c667" />
<img width="654" height="310" alt="consultas avan 4" src="https://github.com/user-attachments/assets/009c5f09-7903-48cb-8950-2d5a8410eca3" />
<img width="806" height="297" alt="consultas avan 6" src="https://github.com/user-attachments/assets/ddd88b7b-191e-421f-9076-034054e10d57" />
<img width="779" height="311" alt="consultas avan2" src="https://github.com/user-attachments/assets/c6aa2f45-8672-4fd3-8787-5056a6b4a20e" />
<img width="909" height="424" alt="avan5" src="https://github.com/user-attachments/assets/c277c2d7-b088-4081-a94d-07d9c11e20d8" />



# 6. backups/ com dump MySQL e instruções de restore

![bck1](https://github.com/user-attachments/assets/8592fa9d-0920-41cf-9ca1-8074c90cf6ad)

![bck2](https://github.com/user-attachments/assets/810b7d03-8516-4d1c-8c04-90889cdc8ed7)

![bck3](https://github.com/user-attachments/assets/f77153ad-eeba-4d23-a8fc-9f1f80b0e521)
