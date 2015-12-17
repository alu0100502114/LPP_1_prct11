| Coveralls | Travis |
| --------- | ------ |
| [![Coverage Status](https://coveralls.io/repos/alu0100502114/LPP_1_prct11/badge.svg?branch=jesus%2Fdev&service=github)](https://coveralls.io/github/alu0100502114/LPP_1_prct11?branch=jesus%2Fdev) | [![Build Status](https://travis-ci.org/alu0100502114/LPP_1_prct11.svg?branch=jesus%2Fdev)](https://travis-ci.org/alu0100502114/LPP_1_prct11) |

## Lenguajes y Paradigmas de Programación

### Práctica de Laboratorio #11.

Programación Funcional. Funciones de orden superior

### Autor: 

   - Jesús Marín Ruiz (jesus/dev): encargado de desarrollar la pruebas y el código que las verifique
    
Considere la jerarquía de clases Ruby para representar una lista de citas y referencias
bibliográ́ficas en formato de la Asociación de Psicología Americana (APA), esto es, una Bibliografía.

Diseñar e implementar un Lenguaje de Dominio Específico Domain Specific Language - DSL, siguiendo
la filosofía de Ruby que permita la definicíon de una bibliografía.

Los DSL son herramientas útiles que permiten expresar fácilmente la lógica específica de un
problema particular (dominio) que de otro modo sería difícil o farragoso de escribir en otro
idioma. Por lo general, se trata de definir una gramática que se asemeja más al léxico utilizado
por el dominio de destino. Por ejemplo, un matemático que trabaja con matrices no piensa en bucles,
iteradores o arrays, sino que piensa en términos de vectores, productos y transformaciones.

El uso de un lenguaje de propósito general, como Ruby, con sólo arrays e iteradores requeriría
que el matemático practicara gimnasia mental para traducir mentalmente entre el dominio de su
problema y el del lenguaje con el que escribe el código (Ruby). El uso de un DSL diseñado para las
operaciones que le interesan eliminaría esta traducción mental y proporcionaría un código más conciso.

Los DSL tienen dos formas: externos e internos. Los DSL externos existen independientemente de
cualquier otro lenguaje. Los DSL internos estan alojados dentro de otro lenguaje de programación
- por ejemplo, Rails es un DSL interno que se aloja en el lenguaje de programación Ruby.

El DSL que diseñe ha de permitir la definición de referencias o citas bibliográficas de una forma
natural.   

### Forma de usar el new:
- Para Artículo de periódico, por ejemplo.
    <pre>
     @periodico1 = Bibliografia::Articulo_Periodico_Natural.new do
            authors   "Jesús Marín, Conchi Barella"
            title     "Como Programar Ruby y no morir en el intento"
            serie     "(Programa para torpes)"
            magazine  :name => "La Pecera",
                      :week => 20,
                      :year => 2015
            editorial "Estante Pragmático"
            edition   "Quinta edición"
            date      "Julio 7, 2015"
            isbns     "968-1937785499, 1937785491"
         end
    </pre>

### Ejemplo de valores en el bloque:
- Para Referencias Naturales:
    <pre>
            authors   "Dave Thomas, Andy Hunt, Chad Fowler"
            title     "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide"
            serie     "(The Facets of Ruby)"
            editorial "Pragmatic Bookshelf"
            edition   "4 edition"
            date      "July 7, 2013"
            isbns     "968-1937785499, 1937785491"
    </pre>
- Para Artículos de revista:
    <pre>
            authors   "José Pérez, Antonio Rdguez"
            title     "Programando Ruby"
            serie     "(Los mil rostros de Ruby)"
            journal   :name => "Título de la revista",
                      :volume => 20,
                      :issue => 3
            editorial "Estante Pragmático"
            edition   "Cuarta edición"
            date      "Julio 7, 2014"
            isbns     "968-1937785499, 1937785491"
    </pre>
- Para Artículos de periódico:
    <pre>
            authors   "Jesús Marín, Conchi Barella"
            title     "Como Programar Ruby y no morir en el intento"
            serie     "(Programa para torpes)"
            magazine  :name => "La Pecera",
                      :week => 20,
                      :year => 2015
            editorial "Estante Pragmático"
            edition   "Quinta edición"
            date      "Julio 7, 2015"
            isbns     "968-1937785499, 1937785491"
    </pre>
- Para Documentos Electrónicos:
    <pre>
            authors   "Jesús Marín, Conchi Barella"
            title     "Como Programar Ruby y no morir en el intento"
            serie     "(Programa para torpes)"
            blog      :name => "La Pecera",
                      :url => "http:vayavaya.com/coproruynomonint"
            editorial "Estante Pragmático"
            edition   "Quinta edición"
            date      "Julio 7, 2015"
            isbns     "968-1937785499, 1937785491"
    </pre>