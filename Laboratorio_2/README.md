# README - Laboratorio 2: Arquitectura y Organización de Computadores

## 👥 Integrantes

**Paralelo 200**
* Javiera Ibaca Morales
* Rol: 202273624-0

**Paralelo 200**
* Mauricio Godoy Cárcamo
* Rol: 202304014-2

## 📝 Descripción general
Este proyecto implementa un decodificador de mensajes encriptados para la Academia de Hackers Éticos CyberSecure. El sistema funciona como un circuito combinacional que decodifica comunicaciones interceptadas de una organización criminal que utiliza displays de 7 segmentos para transmitir información crítica sobre sus operaciones.

## Contexto de la Misión
ByteMaster ha interceptado comunicaciones de una organización criminal que utiliza un sistema de comunicación ultra-secreto basado en displays de 7 segmentos. El sistema criminal utiliza códigos de 4 bits para representar diferentes estados de alerta, ubicaciones y operaciones. Nuestro circuito es capaz de decodificar estos códigos binarios y mostrar el símbolo correspondiente en un display de 7 segmentos.

## 🚀 Funcionamiento
El circuito recibe como entrada un código de 4 bits (A, B, C, D, con D el bit menos significativo) que representa códigos del 0000 al 1111, y decodifica la información criminal mostrando el símbolo correspondiente en un display de 7 segmentos según el sistema de codificación interceptado.

### Sistema de Codificación Criminal
| Código (4 bits)  | Decimal | Símbolo | Significado Criminal        |
|------------------|---------|---------|-----------------------------|
| 0000             | 0       | 0       | Operación en espera         |
| 0001             | 1       | 1       | Agente en posición          |
| 0010             | 2       | 2       | Dos vehículos listos        |
| 0011             | 3       | 3       | Tres puntos de acceso       |
| 0100             | 4       | 4       | Cuatro minutos para iniciar |
| 0101             | 5       | 5       | Cinco millones transferidos |
| 0110             | 6       | 6       | Seis guardias neutralizados |
| 0111             | 7       | 7       | Siete pisos del edificio    |
| 1000             | 8       | 8       | Ocho cajas fuertes          |
| 1001             | 9       | 9       | Nueve rehenes asegurados    |
| 1010             | 10      | A       | Alerta máxima               | 
| 1011             | 11      | b       | Base comprometida           |
| 1100             | 12      | C       | Código de evacuación        |
| 1101             | 13      | d       | Destruir evidencia          |
| 1110             | 14      | E       | Emergencia total            |
| 1111             | 15      | F       | Fin de la operación         |

## 🔧 Metodología y desarrollo
1. ** Análisis de Inteligencia**: 
   * Comprensión del sistema de codificación utilizado por los criminales
   * Identificación de las entradas (4 bits) y salidas (7 segmentos del display)
   * Mapeo de cada código criminal a su símbolo correspondiente

2. ** Diseño del Decodificador**:
   * Desarrollo de tablas de verdad para cada uno de los 7 segmentos de salida (a, b, c, d, e, f, g)
   * Creación de mapas de Karnaugh para simplificar las expresiones booleanas
   * Obtención de funciones booleanas minimizadas para cada segmento del display

3. ** Construcción del Circuito**:
   * Implementación del circuito en Logisim utilizando lógica combinacional
   * Conexión de las expresiones booleanas minimizadas para cada segmento
   * Validación y testeo del decodificador con los 16 códigos criminales

## 🧩 Estructura del circuito
* 📄 **Circuito principal (main)**: Contiene implementado el subcircuito "decifrado" que recibe 4 entradas, y entrega la salida contectada a un display de 7 segmentos
* 📄 **SubCircuito (decifrado)**: Contiene la lógica combinacional para decodificar los mensajes criminales
*  **Entradas**: 4 bits (A, B, C, D) representando códigos del 0000 al 1111
*  **Salidas**: 7 bits para controlar el display de 7 segmentos (abcdefg)

## Documentación de la Operación
Se desarrollaron tablas de verdad completas para los 16 códigos de entrada y las 7 salidas correspondientes a cada segmento del display. Los mapas de Karnaugh permitieron obtener las funciones booleanas minimizadas para un circuito eficiente que pueda decodificar las comunicaciones criminales en tiempo real.

## ⚙️ Supuestos utilizados
* Se asume que todos los códigos de entrada están en el rango válido (0000 a 1111)
* El display de 7 segmentos utiliza lógica positiva (1 = segmento activo, 0 = segmento inactivo)
* Los códigos criminales siguen estrictamente la tabla de codificación interceptada
* El sistema opera en tiempo real para decodificación inmediata

## Instrucciones para ejecutar el circuito en Logisim
1. Abrir Logisim y cargar el archivo `decodificador.circ`
2. El circuito principal se encuentra en el componente "main"
3. Utilizar las entradas de 4 bits para ingresar los códigos criminales (0000 a 1111)
4. Observar la salida en el display de 7 segmentos que mostrará el símbolo decodificado
5. Verificar el funcionamiento probando todos los 16 códigos según la tabla criminal

## 📁 Archivos incluidos
* `README.md`: Este archivo de documentación del proyecto
* `decodificador.circ`: Archivo Logisim con la implementación del circuito decodificador
* `informe.pdf`: Informe completo con diccionario del display, tablas de verdad y mapas de Karnaugh

---
*🏥 Laboratorio 2 - INF245 - Octubre 2025*
