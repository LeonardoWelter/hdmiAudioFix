#!/usr/bin/env bash

# Script criado para reestabelecer o funcionamento do áudio
# através do HDMI utilizando o PulseAudio, quando ocorre um erro
# no PulseAudio e os dispositivos não são detectados

echo "+=================================================+"
echo "|             HDMI Audio Fix Script               |"
echo "|               by Leonado Welter                 |"
echo "+=================================================+"

echo -n "| Removendo arquivos antigos................"
sleep 1
if rm -R ~/.config/pulse/*; then # Remove os arquivos gerados pelo PulseAudio
      echo "...OK |"

      echo "| Iniciando o PulseAudio.......................OK |"
      echo -n "| Reconfigurando o PulseAudio.........."
      sleep 1
    if pavucontrol & pulseaudio -k; then # Inicia o processo do PulseAudio para setar o dispositivo primário
      echo -n "....."                    # Gera novamente a lista de dispositivos
      sleep 1
      echo "...OK |"

      echo -n "| Alterando o dispositivo primário....."
      sleep 2
      echo -n "....."
      sleep 2 # Necessário 4 segundos de espera para o término da geração da lista de dispositivos
      if pacmd set-default-sink 0; then # Configura o dispositivo primário como sendo o HDMI
        echo "...OK |"
      else
        echo "ERRO |"
      fi # Fim IF configuração do dispositivo primário
    else
      echo "ERRO |" # Fim IF geração da lista de dispositivos
    fi
else
    echo "ERRO |" # Fim IF Remoção de arquivos do PulseAudio
fi

echo -n "| Finalizando o PulseAudio............."
# Necessário para esconder o output do kill no terminal
if kill -9 $(pgrep pavucontrol) & wait $(pgrep pavucontrol) 2>/dev/null; then
  echo "........OK |" # Mesmo que o comando dê certo ele não entrará nessa parte da condição
fi
echo "........OK |"

echo "+=================================================+"
sleep 2
exit