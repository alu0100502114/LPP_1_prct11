
# Módulo Bibliográfico
module Bibliografia

  # Clase Referencia para gestionar las de una Bibliografía
  class Referencia
    include Comparable
    # Getters + Setters
    attr_accessor :autores, :titulo, :serie, :editorial, :num_edicion, :fecha_publicacion, :num_isbns

    # Comparador
    def <=> (anOther)
#      @autores <=> anOther.autores
      this_year = @fecha_publicacion[/.*, ([^\)]*)/,1]
      that_year = anOther.fecha_publicacion[/.*, ([^\)]*)/,1]
#      self.autores <=> anOther.autores == 0 ? this_year <=> that_year : self.autores <=> anOther.autores
      [self.autores, this_year, self.titulo] <=> [anOther.autores, that_year, anOther.titulo]
    end

    # Constructor
    def initialize(autores, titulo, serie, editorial, num_edicion, fecha_publicacion, num_isbns)
      if titulo == nil
        return
      end
      @autores = autores
      set_titulo(titulo)
      set_serie(serie)
      @editorial = editorial
      @num_edicion = num_edicion
      @fecha_publicacion = fecha_publicacion
      @num_isbns = num_isbns
    end
    
    # setter de título
    def titulo=(args)
      set_titulo(args)
    end
    
    # soporte de setter de título
    def set_titulo(args)
      args == "" ? @titulo = "" : @titulo = args.split.map(&:capitalize).join(' ')
    end
    
    # setter de serie
    def serie=(args)
      set_serie(args)
    end
    
    # getter de serie
    def get_serie
      @serie
    end
    
    # getter de editorial
    def get_editorial
      @editorial
    end
    
    # soporte de setter de serie
    def set_serie(args)
      args == "" ? @serie = "" : @serie = "(" + args[1..-1].split.map(&:capitalize).join(' ')
    end
    
    # Invierte nombre
    def autor_rev(autor)
      name_parts = autor.split - [" "]
      first_name, last_name = name_parts[0], name_parts[-1]
      last_name + ", " + first_name[0]
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
        lista += "\n\t" if count != num_isbns.size
      end
      lista
    end

    # Para método puts
    def to_s
      "#{print_autor}\n\t#{@titulo}\n\t#{@serie}\n\t#{@editorial}; #{@num_edicion} #{@fecha_publicacion}\n\t#{print_isbn}"
    end

    # Para método puts
    def mi_puts(sufijo)
      this_year = @fecha_publicacion[/.*, ([^\)]*)/,1]
      puts "#{print_autor} (#{this_year})#{sufijo}.\n\t#{@titulo}\n\t#{@serie}\n\t#{@editorial}; #{@num_edicion} #{@fecha_publicacion}\n\t#{print_isbn}"
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
    def mi_puts(sufijo)
      puts "#{print_autor}  #{fecha_publicacion}#{sufijo}.\n\t#{titulo}\n\t#{serie}\n\t#{editorial}; #{num_edicion}\n\t#{print_isbn}"
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
    
  # Referencia natural
  class Referencia_Natural < Publicacion
    
    # Constructor
    def initialize &block
      self.instance_eval &block
    end

    # Sobrecarga de Accessors para uso en bloque
    # getter+setter de autores
    def authors(*args)
      args.length == 1 ? self.autores = args[0].split(", ") : self.autores 
    end
    
    # getter+setter de título
    def title(*args)
      args.length == 1 ? self.titulo = args[0] : self.titulo
    end

    # getter+setter de serie
    def serie(*args)
      args.length == 1 ? self.serie = args[0] : get_serie
    end
    
    # getter+setter de editorial
    def editorial(*args)
      args.length == 1 ? self.editorial = args[0] : get_editorial
    end

    # getter+setter de edición
    def edition(*args)
      args.length == 1 ? self.num_edicion = args[0] : self.num_edicion
    end
    
    # getter+setter de fecha
    def date(*args)
      args.length == 1 ? self.fecha_publicacion = args[0] : self.fecha_publicacion
    end
    
    # getter+setter de isbns
    def isbns(*args)
      args.length == 1 ? self.num_isbns = args[0].split(", ") : self.num_isbns
    end
  end

  # Artículo de Revista Natural
  class Articulo_Revista_Natural < Referencia_Natural
    attr_accessor :journal
    # Constructor
    def initialize &block
      super &block
    end
    
    # getter+setter de journal
    def journal(*args)
      if args.length == 1
        name, volume, issue = args[0][:name], args[0][:volume], args[0][:issue]
        output = ""
        output << "Journal " + name if name != nil
        output << ", Volume " + volume.to_s if volume != nil
        output << ", Issue " + issue.to_s if issue != nil
        self.journal = output
      else
        @journal
      end
    end
    
    # muestra revista natural
    def to_s
      puts @journal + "\n"
      super
    end
  end
  
  # Artículo de Periódico Natural
  class Articulo_Periodico_Natural < Articulo_Periodico
  end
  
  # Documento Electrónico Natural
  class Documento_Electronico_Natural < Documento_Electronico
  end
end
