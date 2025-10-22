# README - Laboratorio 3: Arquitectura y Organización de Computadores

## 👥 Integrantes
- **Javiera Constanza Ibaca Morales**, Rol: 202273624-0
- **Mauricio Godoy Cárcamo**, Rol: 202273616-k

## 📝 Descripción general
Este proyecto implementa un sistema de navegación digital para la ciudad ficticia "Bitópolis", diseñada por Don Bit. El sistema funciona como un GPS simplificado que, mediante un código de entrada de 4 bits (0000-1111), determina una ruta única desde un nodo inicial específico hasta el nodo destino común F, mostrando paso a paso cada sector visitado en un display de 7 segmentos.

La solución utiliza únicamente lógica combinacional y secuencial implementada con compuertas lógicas y flip-flops tipo D, sin el uso de memorias ROM o RAM, cumpliendo con las restricciones establecidas por Don Bit.

## 🚀 Funcionamiento
1. **Entrada**: El usuario ingresa un código binario de 4 bits (0-15 en decimal)
2. **Inicialización**: El sistema identifica el nodo inicial correspondiente al código
3. **Navegación secuencial**: Con cada pulso de reloj, el sistema avanza al siguiente nodo en la ruta predefinida
4. **Visualización**: El display de 7 segmentos muestra el identificador del nodo actual (A, B, C, ..., P)
5. **Finalización**: El recorrido se detiene automáticamente al alcanzar el nodo F

## 🔧 Metodología y desarrollo

1. **🔍 Análisis de requerimientos**: 
  - Estudio del mapa de rutas para identificar todas las conexiones entre nodos
  - Determinación de las 16 rutas únicas desde cada nodo inicial hasta F
  - Análisis de los nodos compartidos entre diferentes rutas para optimizar la lógica

2. **📐 Diseño de la solución**:
  - Diseño de máquina de estados finitos para controlar el avance secuencial
  - Creación de tablas de verdad para la lógica combinacional de siguiente nodo
  - Diseño del decodificador para display de 7 segmentos (A-P)
  - Planificación de la arquitectura modular con subcircuitos especializados

3. **💻 Implementación**:
  - Construcción de subcircuitos individuales en Logisim
  - Integración de módulos en el circuito principal
  - Pruebas unitarias de cada subcircuito
  - Verificación completa del sistema con todos los códigos de entrada
  - Implementación de simulador del grafo entregado en el enunciado

## 🧩 Estructura del circuito

El sistema está organizado en los siguientes subcircuitos principales:

- **`main`**: Circuito principal que integra todos los módulos
- **`display_decoder`**: Decodifica el código de 4 bits para visualización en el display de 7 segmentos
- **`state_register`**: Gestiona el estado actual del sistema y controla la transición entre nodos
  - Captura la entrada inicial solo en el primer ciclo después del reset
  - Utiliza un flip-flop detector de "primer ciclo" que conmuta multiplexores
  - Almacena el estado actual en 4 flip-flops tipo D
  - Implementa la lógica de retroalimentación para avanzar automáticamente por la ruta
- **`next_node_logic`**: Determina el siguiente nodo según el estado actual del sistema
- **`end_detector`**: Detecta cuando se alcanza el nodo F y detiene el sistema
- **`display_on`**: Mantiene los display encendidos después de la primera señal con flip-flops tipo D para así alimentar la primera señal infinitamente hasta su reinicio.

## 💡 Implementación clave: State Register

El circuito `state_register` es fundamental para el funcionamiento del sistema y tiene las siguientes características:

1. **Captura única de entrada**: Implementa un mecanismo que solo permite la entrada externa de códigos durante el primer ciclo después del reset
2. **Sistema de conmutación**: Utiliza multiplexores controlados por un flip-flop de "primer ciclo" para alternar entre entradas externas y retroalimentación
3. **Almacenamiento de estado**: Mantiene el estado actual del recorrido usando flip-flops tipo D
4. **Interfaz con el navegador**: Se conecta al circuito `next_node_logic` para determinar el siguiente nodo en la ruta
5. **Visualización**: Envía el código del nodo actual al decodificador para su visualización

Esta implementación permite que el sistema funcione de manera autónoma después de recibir el código inicial, avanzando secuencialmente por los nodos de la ruta predefinida hasta alcanzar el destino.

## 📊 Tablas de verdad y mapas de Karnaugh

Las tablas de verdad y mapas de Karnaugh utilizados incluyen:

- **Tabla de codificación de nodos**: Mapeo de números 0-15 a caracteres A-P para display
- **Tabla de siguiente nodo**: Lógica para determinar el próximo nodo según ruta y posición actual
- **Tabla de detección de fin**: Condiciones para detectar llegada al nodo F
- **Mapas de Karnaugh**: Simplificación de expresiones booleanas para optimizar el hardware

*Nota: Las tablas y mapas detallados se encuentran en el archivo `informe.pdf`*

## ⚙️ Supuestos utilizados

1. **Sincronización**: Se asume que todas las señales de reloj están sincronizadas y no hay problemas de timing
2. **Inicialización**: El sistema requiere un pulso de reset antes de cada uso para permitir la captura del código inicial
3. **Entrada válida**: Se asume que los códigos de entrada siempre estarán en el rango válido (0000-1111)
4. **Display**: Se considera que el display de 7 segmentos puede mostrar correctamente todos los caracteres A-P
5. **Rutas fijas**: Las rutas están predefinidas según el mapa proporcionado y no cambian durante la ejecución
6. **Comportamiento en F**: Una vez alcanzado el nodo F, el sistema permanece en ese estado hasta un nuevo reset
7. **Frecuencia de reloj**: Se asume una frecuencia de reloj apropiada para la visualización humana del recorrido

## 📁 Archivos incluidos

> 📄 **mapa.circ** - Archivo principal de Logisim con la implementación completa del sistema  
> 📄 **informe.pdf** - Documento técnico con tablas de verdad, mapas de Karnaugh y análisis detallado  
> 📄 **README.md** - Este archivo con información general del proyecto  

---
*🏛️ Laboratorio 3 - INF245 - Mayo-Junio 2025*

