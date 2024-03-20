#!/bin/bash

# Configuração de Variáveis de Ambiente
export DATABASE_HOST="localhost"
export DATABASE_USER="username"
export DATABASE_PASSWORD="password"
export WEB_SERVER_PORT=8080
export APP_SERVER_PORT=3000

# Substitua os comandos abaixo com os comandos específicos para sua distribuição
echo "Instalação de Dependências..."
apt-get update
apt-get upgrade -y
apt-get install apache2 -y
apt-get install nginx -y
apt-get install postgresql -y
apt-get install mysql-client -y
apt-get install curl -y
apt-get install nodejs npm -y
apt-get install unzip -y
apt-get install ufw -y

# Substitua os comandos abaixo com os comandos específicos para o seu banco de dados
echo "Configuração de Bancos de Dados..."
mysql -u"$DATABASE_USER" -p"$DATABASE_PASSWORD" -h"$DATABASE_HOST" -e "CREATE DATABASE IF NOT EXISTS my_database;"
psql -U "$DATABASE_USER" -h "$DATABASE_HOST" -c "CREATE DATABASE my_database;"

# Configuração de Servidores Web Alternativos
echo "Configurando Apache2..."
# Configurações adicionais do Apache2 podem ser adicionadas aqui
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cd linux-site-dio-main
cp -R * /var/www/html/

# Configure o Nginx
echo "Configurando Nginx..."
# Configurações adicionais do Nginx podem ser adicionadas aqui

# Configuração de Servidores de Aplicativos
echo "Configurando servidor de aplicativos..."
# Configurações adicionais do servidor de aplicativos podem ser adicionadas aqui

# Configuração de Balanceadores de Carga
echo "Configurando balanceadores de carga..."
# Configurações adicionais de balanceamento de carga podem ser adicionadas aqui

# Configuração de Firewalls e Regras de Segurança
echo "Configurando firewall e regras de segurança..."
# Configurações adicionais do firewall e regras de segurança podem ser adicionadas aqui
ufw allow ssh
ufw allow http
ufw allow https
ufw enable

# Configuração de Certificados SSL/TLS
echo "Configurando certificados SSL/TLS..."
# Configurações adicionais de SSL/TLS podem ser adicionadas aqui
sudo apt install -y certbot
sudo certbot certonly --nginx -d example.com


# Configuração de Cron Jobs e Tarefas Agendadas
echo "Configurando cron jobs e tarefas agendadas..."
# Cron jobs e tarefas agendadas podem ser configuradas aqui
# sudo crontab -e
# Adicione sua tarefa cron
# * * * * * /path/to/your/script.sh

# Configuração de Proxy Reverso
echo "Configurando proxy reverso..."
# Configurações adicionais de proxy reverso podem ser adicionadas aqui

# Diretório onde os logs serão armazenados
LOG_DIR="/var/log/user_activity"

# Verifica se o diretório de logs existe, se não, cria
if [ ! -d "$LOG_DIR" ]; then
    mkdir -p "$LOG_DIR"
fi

# Nome do arquivo de log
LOG_FILE="$LOG_DIR/user_activity.log"

# Função para registrar a atividade do usuário
log_activity() {
    local user="$1"
    local timestamp=$(date +"%Y-%m-%d %T")
    echo "$timestamp - Usuário $user conectou." >> "$LOG_FILE"
}

# Adiciona um gancho para o script no arquivo /etc/profile para registrar a atividade do usuário em cada login
if ! grep -q "log_activity" /etc/profile; then
    echo -e "\n# Registra atividade do usuário\nlog_activity \"\$USER\"" | sudo tee -a /etc/profile > /dev/null
fi

echo "Configurações concluídas. A atividade do usuário será registrada em $LOG_FILE."