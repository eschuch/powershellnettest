# ______________m_00_m_________       #
# #_\_|___|___|___|___|___|___|\__    #
# #_|/__|___|___|___|___|___|___|_\__ #
# #_/_|___|___|___|___|___|___|___|_# #
#######################################
#    Script para teste de internet    #
#      Desenvolvido em PowerShell     #
#      $PSVersionTable.PSVersion:     #
#    Major  Minor   Build  Revision   #
#    5      1       14393  206        #
# ___________________________________ #
#                                     #
# Primeiro rode o PS em administrador #
# e libere a execução de scripts com  #
# o comando:                          #
# Set-ExecutionPolicy Unrestricted    #
# ---->>>>>     opção A     <<<<<---- #
# ___________________________________ #
#                                     #
# Por: Erico Lima Schuch   els.net.br #
# ___________________________________ #
#                                     #
# 10/12/2016 - V0.1 - Requisitos      #
#_____________________________________# 


# Requisitos:
# Ao ser executado, deve em loop de tempo (10 segundos ???) identificar e registrar (em csv ???) os requisitos para ipv4 e 6:
# 1 - ANO-MES-DIA-HORA-MINUTO-SEGUNDO
# 2 - IPs ativos são utilizáveis (nao loopback, autoip, sem rota, dns configurado)
# 3 - Rota alcançavel (icmp default gw)
# 4 - DNS responde corretamente
# 5 - IPS atuais validos (ipv6 local ok pois é valido. ipv4 deve ser usado um helper externo pois é nat)
# 6 - TRACERT PARA DESTINOS NOMES (MINIMO 4 : GOOGLE.COM.BR, TERRA.COM.BR, CNN.COM, YAHOO.COM ???)
# 7 - TRACERT PARA DESTIVOS IPS  (MINIMO 4 : IP DO GOOGLE.COM.BR, DO TERRA, CNN E YAHOO  ???)
# 8 - 


#1 - ipv4
#1.1 - Verificar se o sistema possui ip, dns e rota; 
#      registra ipv4 config ok/nok;
#      vai para 2 caso nok
#1.2 - verifica se a rota é alcançavel (icmp); registra rota ok/nok; vai para 2 caso nok
#1.3 - faz uma pesquisa dns direto ao servidor configurado no sistema; registra dns response ok:tempo/nok; vai p 2 caso nok
#1.4 - Tracert (google.com ?)
#1.5 - faz um tcp ping (syn - ack) porta 80 e 443 google.com e registra os tempos

