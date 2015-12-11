
# Módulo Bibliográfico
module Bibliografia

  # Clase Referencia para gestionar las de una Bibliografía
  class Referencia
    include Comparable
    # Getters + Setters
    attr_accessor :autores, :titulo, :serie, :editorial, :num_edicion, :fecha_publicacion, :num_isbns
    
    def <=> (anOther)
#      @autores <=> anOther.autores
      this_year = @fecha_publicacion[/.*, ([^\)]*)/,1]
      that_year = anOther.fecha_publicacion[/.*, ([^\)]*)/,1]
#      self.autores <=> anOther.autores == 0 ? this_year <=> that_year : self.autores <=> anOther.autores
      [self.autores, this_year, self.titulo] <=> [anOther.autores, that_year, anOther.titulo]
    end

    # Constructor
    def initialize(autores, titulo, serie, editorial, num_edicion, fecha_publicacion, num_isbns)
      @autores = autores
      @titulo = titulo.split.map(&:capitalize).join(' ')
      serie == "" ? @serie = serie : @serie = '(' + serie[1..-1].split.map(&:capitalize).join(' ')
      @editorial = editorial
      @num_edicion = num_edicion
      @fecha_publicacion = fecha_publicacion
      @num_isbns = num_isbns
    end
    
    def autor_rev(autor)
      name_parts = autor.split - [" "]
      first_name, last_name = name_parts[0], name_parts[-1]
      last_name + ", " + first_name
    end
    
    # Muestra lista de autores
    def print_autor
      count = 0
      lista = ""
      autores.each do |autor|
        count += 1
        lista += autor_rev(autor)
        lista += " & " if count != autores.size
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
    # Constructor
    def initialize(*referencia)
      super(*referencia)
    end
  end
  
  # Tipos Publicaciones hijos de Referencia
  class Publicacion < Referencia
    # Constructor
    def initialize(*referencia)
      super(*referencia)
    end
  end
  
  # Artículo de Revista hijo de Tipos Publicaciones
  class Articulo_Revista < Publicacion
    # Constructor
    def initialize(*referencia)
      super(*referencia)
    end
  end
  
  # Artículo de Periódico hijo de Tipos Publicaciones
  class Articulo_Periodico < Publicacion
    # Constructor
    def initialize(*referencia)
      super(*referencia)
    end
  end
  
  # Documento electrónico hijo de Tipos Publicaciones
  class Documento_Electronico < Publicacion
    # Constructor
    def initialize(*referencia)
      super(*referencia)
    end
  end
  
end
