require 'spec_helper'

describe Bibliografia do
  
  before :each do
      @libro = Bibliografia::Referencia.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"],"Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide")
   end
   
   it "deben existir uno o más autores" do
     expect(@libro.autores).not_to be_empty 
   end
   
   it "debe existir un titulo" do
     expect(@libro.titulo).not_to be_nil
   end
end
