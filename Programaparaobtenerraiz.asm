        ORG 0x1000        ; Inicio del programa en EEPROM

        LD A, B           ; Cargar el número en BCD del registro B al A
        LD C, 0           ; Inicializar C en 0 (C es nuetra variable para la raíz cuadrada)
        LD D, 0           ; D, para comparar posteriormente

        ; Ciclo para encontrar la raíz cuadrada entera
LOOP:
        LD D, C           ; Cargar el valor actual de C en D
        LD A, D           ; Guardar el valor de D en A ya que lo multiplicarémos
        CALL SQUARE       ; Ir a la parte del código que calcula D * D
        CP B              ; Comparar el resultado de la multiplicación con el valor en B
        JP NC, FIN        ; Si es mayor o igual, saltar al final
        INC C             ; Aumentar C para probar el siguiente número
        JP LOOP           ; Repite el ciclo

FIN:
        DEC C             ; Decrementar C si es necesario
        NOP               ; No operación, solo para "rellenar"
        HALT              ; Evita que se ejecute una y otra vez

; Parte que multiplica D * D
SQUARE:
        LD H, 0           ; Inicializar H en 0
        LD L, D           ; Guardar D en L
        ADD HL, HL        ; Sumar HL consigo mismo (esto es como multiplicar por 2)
        RET               ; Regresar al ciclo principal
