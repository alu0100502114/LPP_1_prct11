require "bibliografia/version"

# Módulo Bibliográfico
module Bibliografia

  # Clase Referencia para gestionar las de una Bibliografía
  class Referencia
    # Getters + Setters
    attr_accessor :autores, :titulo, :serie, :editorial, :num_edicion, :fecha_publicacion, :num_isbns

    # Constructor
    def initialize(autores, titulo, serie, editorial, num_edicion, fecha_publicacion, num_isbns)
      @autores = autores
      @titulo = titulo
      @serie = serie
      @editorial = editorial
      @num_edicion = num_edicion
      @fecha_publicacion = fecha_publicacion
      @num_isbns = num_isbns
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

    # Muestra lista de isbn
    def print_isbn
      count = 0
      lista = ""
      isbns.each do |isbn|
        lista += "ISBN-" + isbn.size + ": " + isbn
        lista += "\n" if ++count != isbns.size
      end
      lista
    end

    # Para método puts
    def to_s
      "#{print_autor}\n
       #{titulo}\n
       #{serie}\n
       #{editorial}; #{edicion} (#{fecha_publicacion})\n
       #{print_isbn}\n
      "
    end
  end
end
