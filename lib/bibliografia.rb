require "bibliografia/version"

# Módulo Bibliográfico
module Bibliografia

  # Clase Referencia para gestionar las de una Bibliografía
  class Referencia
    # Getters + Setters
    attr_accessor :autores, :titulo

    # Constructor
    def initialize(autores, titulo)
      @autores = autores
      @titulo = titulo
    end

    # Muestra un autor de la lista
    def print_autor
      count = 0
      lista = ""
      autores.each do |autor|
        lista += autor
        lista += ", " if ++count != autores.size
      end
      lista
    end

    # Para método puts
    def to_s
      "#{print_autor}\n
       #{titulo}\n
      "
    end
  end
end
