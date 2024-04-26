# Paso 1
El ping de PC1 a PC2 no emitia respuesta, ni mensajes ICMP. El ping de PC2 a PC1 daba `network unreachable`, sugiriendo que PC2 no sabia como llegar a redes externas. Se solucionó configurando el default gateway en la PC2, que no lo tenía configurado.

# Paso 2
traceroute envia pings con TTLs sucesivamente mas altos (1,2,3,...), de manera que en cada ping con TTL = i, el i-esimo router de la ruta enviara un mensaje de TTL excedido al host original, efectivamente pudiendo hacer un trace de la ruta. El comando usado fue `sudo traceroute -I 192.168.2.1`.