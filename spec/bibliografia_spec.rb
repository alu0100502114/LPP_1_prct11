require 'spec_helper'

describe Bibliografia do
  
   context "Referencia bibliográfica" do
      before :all do
         @libro = Bibliografia::Referencia.new(
                   ["Dave Thomas", "Andy Hunt", "Chad Fowler"], 
                   "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide",
                   "(The Facets of Ruby)",
                   "Pragmatic Bookshelf",
                   "4 edition",
                   "(July 7, 2013)",
                   ["968-1937785499", "1937785491"]
         )
      end

      it "deben de existir uno o más autores" do
         expect(@libro.autores).not_to be_empty 
      end

      it "debe de existir un título" do
         expect(@libro.titulo).not_to be_nil
      end

      it "debe de existir una serie" do
         expect(@libro.serie).not_to be_nil
      end

      it "debe existir una editorial" do
         expect(@libro.editorial).not_to be_nil
      end

      it "debe existir un número de edición" do
         expect(@libro.num_edicion).not_to be_nil
      end

      it "debe existir una fecha de publicación" do
         expect(@libro.fecha_publicacion).not_to be_nil
      end

      it "debe existir uno o más números ISBN" do
         expect(@libro.num_isbns).not_to be_empty 
      end

      it "debe existir un método para obtener el listado de autores" do
         expect(@libro.print_autor).to eq("Dave Thomas, Andy Hunt, Chad Fowler")
      end

      it "Existe método para obtener el titulo" do
         expect(@libro.titulo).to eq("Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide")
      end

      it "Existe un método para obtener la serie" do
         expect(@libro.serie).to eq("(The Facets of Ruby)") 
      end

      it "Existe un método que devuelve la editorial" do
         expect(@libro.editorial).to eq("Pragmatic Bookshelf")     
      end

      it "Existe un método para obtener el número de edición" do
         expect(@libro.num_edicion).to eq("4 edition") 
      end

      it "Existe un método para obtener la fecha de publicación" do
         expect(@libro.fecha_publicacion).to eq("(July 7, 2013)") 
      end

      it "Existe un método para obtener el listado ISBN" do
         expect(@libro.print_isbn).to eq("ISBN-13: 968-1937785499\nISBN-10: 1937785491\n")
      end

      it "Existe un método para obtener la referencia formateada" do
         expect(@libro.to_s).to eq ("Dave Thomas, Andy Hunt, Chad Fowler\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide\n(The Facets of Ruby)\nPragmatic Bookshelf; 4 edition (July 7, 2013)\nISBN-13: 968-1937785499\nISBN-10: 1937785491\n")
      end
   end # context referencia
    
   context "Nodo" do
      before :all do
         @libro = Bibliografia::Referencia.new(
                   ["Dave Thomas", "Andy Hunt", "Chad Fowler"], 
                   "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide",
                   "(The Facets of Ruby)",
                   "Pragmatic Bookshelf",
                   "4 edition",
                   "(July 7, 2013)",
                   ["968-1937785499", "1937785491"]
          )
         @nudo = Node.new(@libro)
      end
      
      it "deben de existir un nodo conteniendo libro de '4 edition'" do
         expect(@nudo.value.num_edicion).to eq("4 edition")
      end

      it "Existe un método en Nodo para obtener la referencia formateada" do
         expect(@nudo.to_s).to eq("Dave Thomas, Andy Hunt, Chad Fowler\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide\n(The Facets of Ruby)\nPragmatic Bookshelf; 4 edition (July 7, 2013)\nISBN-13: 968-1937785499\nISBN-10: 1937785491\n")
      end

   end # context nodo
   
   context "Lista Enlazada" do
      before :all do
         @libro1 = Bibliografia::Referencia.new(
            ["Dave Thomas", "Andy Hunt", "Chad Fowler"], 
            "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide",
            "(The Facets of Ruby)",
            "Pragmatic Bookshelf",
            "4 edition",
            "(July 7, 2013)",
            ["968-1937785499", "1937785491"]
         )

         @libro2 = Bibliografia::Referencia.new(
            ["Scott Chacon"],
            "Pro Git 2009th Edition",
            "(Pro)",
            "Apress",
            "2009 edition",
            "(August 27, 2009)",
            ["978-1430218333", "1430218339"]
         )
         
         @libro3 = Bibliografia::Referencia.new(
            ["David Flanagan", "Yukihiro Matsumoto"],
            "The Ruby Programming Language",
            "",
            "O’Reilly Media",
            "1 edition",
            "(February 4, 2008)",
            ["0596516177", "978-0596516178"]
         )
         
         @libro4 = Bibliografia::Referencia.new(
            ["David Chelimsky", "Dave Astels", "Bryan Helmkamp", "Dan North", "Zach Dennis", "Aslak Hellesoy"],
            "The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends",
            "(The Facets of Ruby)",
            "Pragmatic Bookshelf",
            "1 edition",
            "(December 25, 2010)",
            ["1934356379", "978-1934356371"]
         )
         
         @libro5 = Bibliografia::Referencia.new(
            ["Richard E. Silverman"],
            "Git Pocket Guide",
            "",
            "O’Reilly Media",
            "1 edition",
            "(August 2, 2013)",
            ["1449325866", "978-1449325862"]
         )
         
         @lista = List.new
      end # end before

      it "Se puede insertar un elemento por el inicio" do
         @lista.ins_start(@libro1)
         expect(@lista.head.is_a? Node).to eq(true)
         expect(@lista.head.value.is_a? Bibliografia::Referencia).to eq(true)
         expect(@lista.head.value.titulo).to eq("Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide")
      end
 
      it "Se pueden añadir varios elementos por el final" do
         @lista.ins_end(@libro2)
         @lista.ins_end(@libro3)
         @lista.ins_end(@libro4)
         @lista.ins_end(@libro5)
         expect(@lista.length).to eq(5)
      end
      
      it "Debe existir cada Nodo de la lista con sus datos y su siguiente" do
         e = @lista.head
         while e.next != nil
            expect(e.is_a? Node).to eq(true)
            expect(e.value.is_a? Bibliografia::Referencia).to eq(true)
            expect(e.next.is_a? Node).to eq(true)
            e = e.next
         end
         expect(e.is_a? Node).to eq(true)
         expect(e.value.is_a? Bibliografia::Referencia).to eq(true)
      end

      it "Cada elemento de la lista debe de ser un Nodo con un libro" do
         e = @lista.head
         while e.next != nil
            expect(e.value.is_a? Bibliografia::Referencia).to eq(true)
            e = e.next
         end
      end
      
      it "Cada elemento de la lista debe de ser un Nodo con un libro con Título" do
         e = @lista.head
         while e.next != nil
            expect(e.value.titulo).not_to be_empty
            e = e.next
         end
         expect(e.value.titulo).not_to be_empty
      end

      it "Cada elemento de la lista debe de ser un Nodo con un libro con Autor(es)" do
         e = @lista.head
         while e.next != nil
            expect(e.value.autores).not_to be_empty
            e = e.next
         end
         expect(e.value.autores).not_to be_empty
      end
      
      it "El segundo elemento de la lista es Libro2" do
         e = @lista.head
         e = @lista.head.next
         expect(e.value.to_s).to eq(@libro2.to_s)
      end
      
      it "Debe de existir una lista con su cabeza" do
         e = @lista.head
         expect(e.value.to_s).to eq(@libro1.to_s)
      end
            
      it "Se extrae el primer elemento de la lista" do
         e = @lista.extract_first
         expect(e.value.to_s).to eq(@libro1.to_s)
         expect(@lista.length).to eq(4)
      end
   end # context lista
   
   context "Lista Doblemente Enlazada" do
      before :all do
         @ref1 = Bibliografia::Referencia.new(
            ["Dave Thomas", "Andy Hunt", "Chad Fowler"], 
            "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide",
            "(The Facets of Ruby)",
            "Pragmatic Bookshelf",
            "4 edition",
            "(July 7, 2013)",
            ["968-1937785499", "1937785491"]
         )

         @ref2 = Bibliografia::Referencia.new(
            ["Scott Chacon"],
            "Pro Git 2009th Edition",
            "(Pro)",
            "Apress",
            "2009 edition",
            "(August 27, 2009)",
            ["978-1430218333", "1430218339"]
         )
         
         @ref3 = Bibliografia::Referencia.new(
            ["David Flanagan", "Yukihiro Matsumoto"],
            "The Ruby Programming Language",
            "",
            "O’Reilly Media",
            "1 edition",
            "(February 4, 2008)",
            ["0596516177", "978-0596516178"]
         )
         
         @ref4 = Bibliografia::Referencia.new(
            ["David Chelimsky", "Dave Astels", "Bryan Helmkamp", "Dan North", "Zach Dennis", "Aslak Hellesoy"],
            "The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends",
            "(The Facets of Ruby)",
            "Pragmatic Bookshelf",
            "1 edition",
            "(December 25, 2010)",
            ["1934356379", "978-1934356371"]
         )
         
         @ref5 = Bibliografia::Referencia.new(
            ["Richard E. Silverman"],
            "Git Pocket Guide",
            "",
            "O’Reilly Media",
            "1 edition",
            "(August 2, 2013)",
            ["1449325866", "978-1449325862"]
         )
         
         @libro1 = Bibliografia::Libro.new(
            ["Dave Thomas", "Andy Hunt", "Chad Fowler"], 
            "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide",
            "(The Facets of Ruby)",
            "Pragmatic Bookshelf",
            "4 edition",
            "(July 7, 2013)",
            ["968-1937785499", "1937785491"]
         )

         @libro2 = Bibliografia::Libro.new(
            ["Scott Chacon"],
            "Pro Git 2009th Edition",
            "(Pro)",
            "Apress",
            "2009 edition",
            "(August 27, 2009)",
            ["978-1430218333", "1430218339"]
         )
         
         @pub1 = Bibliografia::Articulo_Revista.new(
            ["Dave Thomas", "Andy Hunt", "Chad Fowler"], 
            "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide",
            "(The Facets of Ruby)",
            "Pragmatic Bookshelf",
            "4 edition",
            "(July 7, 2013)",
            ["968-1937785499", "1937785491"]
         )

         @pub2 = Bibliografia::Articulo_Periodico.new(
            ["Scott Chacon"],
            "Pro Git 2009th Edition",
            "(Pro)",
            "Apress",
            "2009 edition",
            "(August 27, 2009)",
            ["978-1430218333", "1430218339"]
         )

         @pub3 = Bibliografia::Documento_Electronico.new(
            ["Scott Chacon"],
            "Pro Git 2009th Edition",
            "(Pro)",
            "Apress",
            "2009 edition",
            "(August 27, 2009)",
            ["978-1430218333", "1430218339"]
         )
         
         @lista = List2.new
      end # end before
      
      it "Se puede insertar un elemento por el inicio" do
         @lista.ins_start(@ref1)
         expect(@lista.head.is_a? Node).to eq(true)
         expect(@lista.head.value.is_a? Bibliografia::Referencia).to eq(true)
         expect(@lista.head.value.titulo).to eq("Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide")
      end
 
      it "Se pueden añadir varios elementos por el final" do
         @lista.ins_end(@ref2)
         @lista.ins_end(@ref3)
         @lista.ins_end(@ref4)
         @lista.ins_end(@ref5)
         expect(@lista.length).to eq(5)
      end
      
      it "Debe existir cada Nodo de la lista con sus datos y su siguiente" do
         e = @lista.head
         while e.next != nil
            expect(e.is_a? Node).to eq(true)
            expect(e.value.is_a? Bibliografia::Referencia).to eq(true)
            expect(e.next.is_a? Node).to eq(true)
            e = e.next
         end
         expect(e.is_a? Node).to eq(true)
         expect(e.value.is_a? Bibliografia::Referencia).to eq(true)
      end
       
      it "Debe existir cada Nodo de la lista con sus datos y su anterior" do
         e = @lista.tail
         while e.prev != nil
            expect(e.is_a? Node).to eq(true)
            expect(e.value.is_a? Bibliografia::Referencia).to eq(true)
            expect(e.prev.is_a? Node).to eq(true)
            e = e.prev
         end
         expect(e.is_a? Node).to eq(true)
         expect(e.value.is_a? Bibliografia::Referencia).to eq(true)
      end

      it "Cada elemento de la lista debe de ser un Nodo con un ref" do
         e = @lista.head
         while e.next != nil
            expect(e.value.is_a? Bibliografia::Referencia).to eq(true)
            e = e.next
         end
      end
      
      it "Cada elemento de la lista debe de ser un Nodo con un ref con Título" do
         e = @lista.head
         while e.next != nil
            expect(e.value.titulo).not_to be_empty
            e = e.next
         end
         expect(e.value.titulo).not_to be_empty
      end

      it "Cada elemento de la lista debe de ser un Nodo con un ref con Autor(es)" do
         e = @lista.head
         while e.next != nil
            expect(e.value.autores).not_to be_empty
            e = e.next
         end
         expect(e.value.autores).not_to be_empty
      end
      
      it "El segundo elemento de la lista es ref2" do
         e = @lista.head
         e = @lista.head.next
         expect(e.value.to_s).to eq(@ref2.to_s)
      end
      
      it "Debe de existir una lista con su cabeza" do
         e = @lista.head
         expect(e.value.to_s).to eq(@ref1.to_s)
      end      
      
      it "Debe de existir una lista con su cola" do
         e = @lista.tail
         expect(e.value.to_s).to eq(@ref5.to_s)
      end
            
      it "Se extrae el primer elemento de la lista" do
         e = @lista.extract_first
         expect(e.value.to_s).to eq(@ref1.to_s)
         expect(@lista.length).to eq(4)
      end
            
      it "Se extrae el último elemento de la lista" do
         e = @lista.extract_last
         expect(e.value.to_s).to eq(@ref5.to_s)
         expect(@lista.length).to eq(3)
      end
       
      it "Se añaden 2 libros por el final" do
         @lista.ins_end(@libro1)
         @lista.ins_end(@libro2)
         expect(@lista.length).to eq(5)
      end
            
      it "El último elemento de la lista es de tipo libro" do
         expect(@lista.tail.value).to be_a Bibliografia::Libro
      end
       
      it "Se añaden 3 publicaciones distintas por el final" do
         @lista.ins_end(@pub1)
         @lista.ins_end(@pub2)
         @lista.ins_end(@pub3)
         expect(@lista.length).to eq(8)
      end
            
      it "El último elemento de la lista es una Publicación Periódica de Documento electrónico" do
         last = @lista.tail.value.class.superclass.to_s
         expect(last).to eq("Bibliografia::Publicacion")
         expect(@lista.tail.value).to be_a(Bibliografia::Documento_Electronico)
      end
            
      it "El penúltimo elemento de la lista es una Publicación Periódica de Artículo de Periódico" do
         last = @lista.tail.value.class.superclass.to_s
         expect(last).to eq("Bibliografia::Publicacion")
         expect(@lista.tail.prev.value).to be_a(Bibliografia::Articulo_Periodico)
      end
            
      it "El antepenúltimo elemento de la lista es una Publicación Periódica de Artículo de Revista" do
         last = @lista.tail.value.class.superclass.to_s
         expect(last).to eq("Bibliografia::Publicacion")
         expect(@lista.tail.prev.prev.value).to be_a(Bibliografia::Articulo_Revista)
      end
            
      it "El último elemento de la lista es pub3" do
         e = @lista.tail
         expect(e.value.to_s).to eq(@pub3.to_s)
      end
   end # context lista2
   
end # describe
