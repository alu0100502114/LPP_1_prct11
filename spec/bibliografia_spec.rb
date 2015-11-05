require 'spec_helper'

describe Bibliografia do
  
  before :each do
      @libro = Bibliografia::Referencia.new(
        ["Dave Thomas", "Andy Hunt", "Chad Fowler"],
        "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide",
        "(The Facets of Ruby)"
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
end
