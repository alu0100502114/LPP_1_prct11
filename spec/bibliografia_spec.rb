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
   end # context
    
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
   end # context
   
end # describe
