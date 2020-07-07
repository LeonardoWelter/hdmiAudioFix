#!/usr/bin/env bash

# Script criado para reestabelecer o funcionamento do áudio
# através do HDMI utilizando o PulseAudio, quando ocorre um erro
# no PulseAudio e os dispositivos não são detectados

echo "+=======================================+"
echo "|        HDMI Audio Fix Script          |"
echo "|          by Leonado Welter            |"
echo "+=======================================+"


if rm -R ~/.config/pulse/*; then
      echo "|     Arquivos removidos com sucesso    |"
    if pulseaudio -k; then
      echo "| PulseAudio reconfigurado com sucesso! |"
    else
      echo "| Não foi possível reconfigurar o pulseaudio. |"
    fi
else
    echo "| Não foi possível remover os arquivos. |";
fi

echo "+=======================================+"
sleep 2
exit