#!/bin/bash

# Função para verificar o status do domínio
check_domain_status() {
  local domain="$1"
  if whois "$domain" | grep -qi "No match"; then
    # Domínio disponível
    echo "✅ FREE: $domain"
  else
    # Domínio indisponível
    echo "🚫 USED: $domain"
  fi
}

# Verifica se o usuário forneceu os argumentos necessários
if [[ -z "$1" ]]; then
  echo "Uso: $0 <domínio ou caminho_para_o_arquivo_de_domínios> [on|off]"
  echo "on  : mostrar apenas os domínios disponíveis"
  echo "off : mostrar apenas os domínios indisponíveis"
  echo "Deixe vazio para mostrar todos os domínios"
  exit 1
fi

# Atribui os argumentos às variáveis
INPUT="$1"
FILTER=$(echo "$2" | tr '[:upper:]' '[:lower:]')  # Converte para minúsculas usando tr

# Verifica se o input é um arquivo
if [[ -f "$INPUT" ]]; then
  # Verifica se o arquivo existe
  if [[ ! -f "$INPUT" ]]; then
    echo "Erro: Arquivo '$INPUT' não encontrado."
    exit 1
  fi

  # Loop para cada domínio no arquivo
  while read -r domain; do
    # Pule linhas vazias
    [[ -z "$domain" ]] && continue

    # Verifica a disponibilidade do domínio
    STATUS=$(check_domain_status "$domain")

    # Filtra a saída com base no parâmetro 'FILTER'
    if [[ -z "$FILTER" || "$FILTER" == "on" && "$STATUS" == "FREE"* || "$FILTER" == "off" && "$STATUS" == "USED"* ]]; then
      echo "$STATUS"
    fi
  done < "$INPUT"

# Verifica se o input é um único domínio
elif [[ "$INPUT" =~ ^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
  # Verifica a disponibilidade do domínio
  STATUS=$(check_domain_status "$INPUT")

  # Filtra a saída com base no parâmetro 'FILTER'
  if [[ -z "$FILTER" || "$FILTER" == "on" && "$STATUS" == "FREE"* || "$FILTER" == "off" && "$STATUS" == "USED"* ]]; then
    echo "$STATUS"
  fi

else
  echo "Uso: $0 <domínio ou caminho_para_o_arquivo_de_domínios> [on|off]"
  exit 1
fi
