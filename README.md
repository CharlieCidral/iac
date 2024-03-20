# Configuração Automatizada de Servidor Linux

Este projeto consiste em um conjunto de scripts Bash que automatizam a configuração inicial de um servidor Linux. O objetivo é facilitar a configuração de um ambiente de servidor comum, incluindo a instalação de software, configuração de serviços, segurança básica e outras tarefas comuns.

## Funcionalidades

- Instalação de dependências comuns, como Apache2, Nginx, PostgreSQL, MySQL, etc.
- Configuração de bancos de dados conforme especificado pelo usuário.
- Configuração de servidores web alternativos, como Apache2 e Nginx.
- Configuração de servidores de aplicativos.
- Configuração de balanceadores de carga.
- Configuração de firewall e regras de segurança.
- Configuração de certificados SSL/TLS usando Certbot.
- Configuração de cron jobs e tarefas agendadas.
- Configuração de proxy reverso.
- Registro de atividade do usuário.

## Pré-requisitos

- Sistema operacional Linux (testado em distribuições baseadas em Debian).
- Permissões de superusuário (root) para executar os scripts.

## Uso

1. Clone este repositório em seu servidor Linux:

    ```
    git clone https://github.com/CharlieCidral/iac.git
    cd iac
    ```

2. Edite o script `iac.sh` para personalizar as configurações conforme necessário, incluindo variáveis de ambiente, configurações de banco de dados, etc.

3. Execute o script `iac.sh`(talvez seja necessario habilitar a execução do arquivo):

    ```
    sudo ./iac.sh
    ```

4. Siga as instruções apresentadas pelo script durante a execução.

5. Após a conclusão da execução do script, seu servidor estará configurado conforme especificado.

## Notas adicionais

- Este script foi desenvolvido para fins educacionais e pode não ser adequado para ambientes de produção sem modificações adicionais.
- É altamente recomendável revisar e entender completamente o script antes de executá-lo em um ambiente de produção.
- Teste este script em um ambiente de teste antes de usar em produção para evitar efeitos colaterais indesejados.

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para enviar pull requests com melhorias, correções de bugs, ou novas funcionalidades.

## Licença

Este projeto é licenciado sob a [MIT License](LICENSE).
