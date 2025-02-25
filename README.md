# Smartbit Robot Project

Este é o projeto inicial de automação utilizando Robot Framework. O objetivo deste projeto é estudar e aplicar conceitos de automação de testes.

## Estrutura do Projeto

- `browser/`: Contém os rastros do navegador.
- `logs/`: Contém os logs gerados durante a execução dos testes.
- `resources/`: Contém os recursos utilizados nos testes, como bibliotecas e arquivos de configuração.
- `tests/`: Contém os arquivos de teste escritos em Robot Framework.

## Recursos Utilizados

- `libs/Account.py`: Script Python que gera dados de conta fictícios utilizando a biblioteca Faker.

## Como Executar os Testes

1. Certifique-se de ter o Robot Framework instalado.
2. Navegue até o diretório do projeto.
3. Execute o comando:

```sh
robot -d ./logs tests/