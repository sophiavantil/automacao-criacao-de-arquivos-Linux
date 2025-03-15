#!/bin/bash

read -p "Digite seu nome: " nome

quantidade=25

if [[ $(ls ${nome}* 2>/dev/null | wc -l) -eq 0 ]]; then
  ultimo_numero=0
else
  ultimo_numero=$(ls ${nome}* 2>/dev/null | sed -E "s/[^0-9]+//g" | sort -n | tail -n 1)
fi

for ((i=1; i<=quantidade; i++)); do
  numero=$((ultimo_numero + i))
  touch "${nome}${numero}"
done

echo "Criados ${quantidade} arquivos com sucesso para ${nome}!"

echo "Lista de arquivos criados:"
ls -v ${nome}*