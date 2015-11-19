
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

    # Muestra lista de autores
    def print_autor
      count = 0
      lista = ""
      autores.each do |autor|
        count += 1
        lista += autor
        lista += ", " if count != autores.size
      end
      lista
    end

    # Muestra lista de isbn
    def print_isbn
      lista = ""
      num_isbns.each do |isbn|
        count = 0
        lista += "ISBN-" + isbn.delete('^0-9').size.to_s + ": " + isbn
        lista += "\n" if count != num_isbns.size
      end
      lista
    end

    # Para método puts
    def to_s
      "#{print_autor}\n#{titulo}\n#{serie}\n#{editorial}; #{num_edicion} #{fecha_publicacion}\n#{print_isbn}"
    end
  end
  
  # Tipos Libros hijos de Referencia
  class Libro < Referencia
    # Getters + Setters
    attr_reader :tipo
    
    # Constructor
    def initialize(*referencia, tipo)
      @tipo = tipo
      if tipo == nil
        @tipo = :libro
      end
      super(*referencia)
    end
  end
  
  # Tipos Publicaciones hijos de Referencia
  class Publicacion < Referencia
    # Getters + Setters
    # El tipo es :publicacion_periodica por defecto
    # El subtipo puede ser:
    #   :articulo_revista
    #   :articulo_periodico
    #   :documento_electronico por defecto
    attr_reader :tipo, :subtipo
    
    # Constructor
    def initialize(*referencia, tipo, subtipo)
      @tipo = tipo
      if @tipo == nil
        @tipo = :publicacion_periodica
      end
      @subtipo = subtipo
      if @subtipo == nil
        @subtipo = :documento_electronico
      end
      super(*referencia)
    end
  end
  
end
