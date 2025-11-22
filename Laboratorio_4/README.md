# README - Laboratorio 3: Arquitectura y Organización de Computadores

## 👥 Integrantes
- **Javiera Constanza Ibaca Morales**   
Rol: 202273624-0  
Paralelo:200  

- **Mauricio Godoy Cárcamo**  
Rol: 202304014-2
Paralelo: 200

## Especificación de algoritmos y desarrollo realizado

### Desafío 1: Secuencia de Collatz y Jerarquía Criminal
- Se implementó un algoritmo iterativo para calcular la secuencia de Collatz para cada ID ingresado.
- El programa solicita la cantidad de IDs y luego los valores, validando el rango permitido.
- Para cada ID, se calcula la secuencia, el número de pasos y el máximo alcanzado, asignando un rango jerárquico según los pasos.

### Desafío 2: Descifrador de Claves por Matriz de Bits
- Se desarrolló un sistema de validación multi-capa para claves de 16 caracteres.
- La validación incluye análisis de composición, paridad posicional por bloques y verificación de hash.
- El programa informa la capa fallida en caso de error y acepta la clave solo si pasa todas las verificaciones.

## Supuestos utilizados
- Los IDs ingresados en Desafío 1 son números enteros positivos y dentro del rango permitido (1 a 20).
- **En Desafío 1, los IDs se ingresan uno a uno, cada vez que el programa lo solicita, y no como una lista separada por comas.**
- La clave ingresada en Desafío 2 tiene exactamente 16 caracteres ASCII.
- El usuario ingresa los datos correctamente según lo solicitado por el programa.

## Desafío 1: Explicación de la recursión
- Aunque la consigna menciona recursión, la secuencia de Collatz se implementó de forma iterativa por limitaciones del entorno RARS y para evitar desbordes de pila.
- El algoritmo simula la recursión mediante un bucle, actualizando el valor y contando los pasos hasta llegar a 1.
- Se mantiene el máximo alcanzado en la secuencia y se imprime el recorrido paso a paso.

## Desafío 2: Estructuras de datos utilizadas
- Se utiliza un espacio de memoria para almacenar la clave como un arreglo de caracteres.
- Los contadores para cada tipo de carácter (mayúsculas, minúsculas, dígitos, especiales) se implementan con registros.
- La validación por bloques se realiza recorriendo la clave en segmentos de 4 caracteres, sumando sus valores ASCII.
- El hash se calcula usando operaciones aritméticas sobre los valores ASCII de la clave.

## Instrucciones de compilación y ejecución en RARS
1. Abrir RARS (versión 1.6 o superior).
2. Cargar el archivo correspondiente (`desafio_1.s` o `desafio_2.asm`).
3. Compilar el programa presionando **F3** (o seleccionando "Assemble" en el menú superior).
4. Ejecutar el programa presionando **F5** (o seleccionando "Run" en el menú superior).
5. Seguir las instrucciones en pantalla para ingresar los datos solicitados.

---

