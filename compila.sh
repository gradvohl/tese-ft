#!/bin/bash
#
# Esse script faz todo o processo de compilacao do template (modelo) 
# de teses e dissertacoes da FT.
#
# Script desenvolvido por Prof. Andre Leon S. Gradvohl, Dr.
# Em 26/marco/2024.
#
# Exemplo de utilizacao:
#    ./compila.sh tese.tex
#
# Verificacoes iniciais
if [ $# -ne 1 ] || [ ! -f $1 ]; then
  echo "Voce deve informar o nome do arquivo principal como parametro" 1>&2
  echo -e "Exemplo:\n\t $0 tese.tex\n" 1>&2
  exit 1
fi

# Variaveis que contem informacoes sobre o nome do arquivo
NOMEARQCOMPLETO=$1
NOMEARQ=`basename "${NOMEARQCOMPLETO}" .tex`

# Variaveis com cores
RED='\033[0;31m'
GREEN='\033[0;32m'
LIGHTBLUE='\033[1;34m'
NC='\033[0m' # No Color


PDFLATEX=`which pdflatex 2>/dev/null`
PDFLATEX="${PDFLATEX} -halt-on-error -file-line-error"
if [ $? -eq 1 ]; then 
  echo "O compilador pdflatex nao esta instalado" 1>&2
  echo "Acesse o site https://www.tug.org/texlive/acquire-netinstall.html e instale a ultima versao completa do TeX" 1>&2
  exit 2
fi

BIBER=`which biber 2>/dev/null`
if [ $? -eq 1 ]; then
  echo "O compilador biber nao esta instalado" 1>&2
  echo "Acesse o site https://www.tug.org/texlive/acquire-netinstall.html e instale a ultima versao completa do TeX" 1>&2
  exit 2
fi

MAKEINDEX=`which makeindex 2>/dev/null`
if [ $? -eq 1 ]; then
  echo "O compilador makeindex nao esta instalado" 1>&2
  echo "Acesse o site https://www.tug.org/texlive/acquire-netinstall.html e instale a ultima versao completa do TeX" 1>&2
  exit 3
fi

# Iniciando as compilacoes
# O pdflatex vem primeiro.
echo -e ">>> ${GREEN}Primeira rodada de compilacao do projeto.${NC}"
echo -e ">>> ${LIGHTBLUE}Se houver erros, o script vai parar na primeira ocorrência.${NC}"
echo -e ">>> ${LIGHTBLUE}Não se preocupe com as advertencias e aguarde!${NC}\n"
${PDFLATEX} ${NOMEARQCOMPLETO} | \
            awk 'BEGIN{IGNORECASE = 1}/warning|!/,/^$/;'
# Verifica se o comando ${PDFLATEX} deu erro.
# O vetor PIPESTATUS contem o retorno do primeiro comando do pipe.
if [ ${PIPESTATUS[0]} -ne 0 ]; then
  echo -e "${RED}Houve erros durante a compilacao inicial.${NC}" 1>&2
  echo -e "${RED}Corrija o erro e instancie esse script novamente.${NC}\n" 1>&2
  exit 4
fi
#
#
echo -e "${GREEN}========== Primeira compilacao completa ==========${NC}"
#
# Agora as referencias bibliograficas com o comando biber. 
echo -e "\n>>> ${LIGHTBLUE}Resolvendo as referencias bibliograficas.${NC}"
echo -e ">>> ${LIGHTBLUE}Aguarde!${NC}"
#
${BIBER} ${NOMEARQ}
if [ $? -ne 0 ]; then
  echo -e "${RED}Houve problemas nas referencias bibliográficas.${NC}"
  echo -e "${RED}Tente localizar e resolver o problema analisando as mensagens anteriores.${NC}"
  exit 5
fi
#
echo -e "${GREEN}======= Resolucao das referencias completa ======${NC}"
#
# Agora a lista de siglas e abreviaturas com o comando makeindex.
echo -e "\n>>> ${LIGHTBLUE}Resolvendo a lista de siglas.${NC}\n>>> ${LIGHTBLUE}Aguarde!${NC}"
ARQNLO="${NOMEARQ}.nlo"
ARQNLS="${NOMEARQ}.nls"
NOMENCL="nomencl.ist"

${MAKEINDEX} ${ARQNLO} -s ${NOMENCL} -o ${ARQNLS}
if [ $? -ne 0 ]; then
  echo -e "${RED}Houve problemas na geracao das referencias bibliograficas.${NC}"
  echo -e "${RED}Tente localizar e resolver o problema analisando as mensagens anteriores.${NC}"
  exit 6
fi
#
echo -e "${GREEN}======= Resolucao da lista de simbolos completa ======${NC}\n"
#
# Mais uma rodada com o pdflatex
echo -e ">>> ${LIGHTBLUE}Segunda rodada de compilacao do projeto.${NC}" 
echo -e ">>> ${LIGHTBLUE}Nao devem aparecer erros agora. Apenas advertencias!${NC}"
echo -e ">>> ${LIGHTBLUE}Aguarde!${NC}\n"
#
${PDFLATEX} ${NOMEARQCOMPLETO} | \
            awk 'BEGIN{IGNORECASE = 1}/warning|!/,/^$/;'
#
if [ ${PIPESTATUS[0]} -ne 0 ]; then
  echo -e "${RED}Houve erros durante a segunda compilacao.${NC}" 1>&2
  echo -e "${RED}Corrija o erro e instancie esse script novamente.${NC}\n" 1>&2
  exit 7
fi
#
echo -e "${GREEN}======= Segunda rodada de compilacao completa =======${NC}\n"
#
# Mais uma rodada com o pdflatex
echo -e ">>> ${LIGHTBLUE}Terceira rodada de compilacao do projeto.${NC}"
echo -e ">>> ${LIGHTBLUE}Apenas para garantir que nao restou nada para tras.${NC}"
echo -e ">>> ${LIGHTBLUE}Aguarde!${NC}\n"
${PDFLATEX} ${NOMEARQCOMPLETO} | \
            awk 'BEGIN{IGNORECASE = 1}/warning|!/,/^$/;'
#
if [ ${PIPESTATUS[0]} -ne 0 ]; then
  echo -e "${RED}Houve erros durante a terceira compilacao.${NC}" 1>&2
  echo -e "${RED}Corrija o erro e instancie esse script novamente.${NC}\n" 1>&2
  exit 8
fi

echo -e "${GREEN}======= Terceira rodada de compilacao completa =======${NC}"
echo -e ">>> ${LIGHTBLUE}Provavelmente, deu tudo certo!${NC}" 
echo -e ">>> ${LIGHTBLUE}Verifique se o arquivo ${NOMEARQ}.pdf foi gerado corretamente.${NC}\n"
exit 0
