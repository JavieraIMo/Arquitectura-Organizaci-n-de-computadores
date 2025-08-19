

def decimalABinario(numero):

    binario = ''

    while(numero >= 1):

        binario+= str(int(numero % 2))
        numero/=2

    
    return int(binario[::-1])


def binarioADecimal(numero):

    suma = 0

    for i, valor in enumerate(str(numero)[::-1]):

       
        suma+= int(valor)*(2**i)
       
    return suma


def decimalAOctal(numero):

    octal = ''

    while(numero >= 1):

        octal+= str(int(numero % 8))
        numero/=8

    
    return int(octal[::-1])

def octalADecimal(numero):

    suma = 0

    for i, valor in enumerate(str(numero)[::-1]):

       
        suma+= int(valor)*(8**i)
       

    return suma
        
