require 'spec_helper'

describe Bibliografia do
  
  before :each do
      @libro = Bibliografia::Referencia.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"])
   end
   
   it "deben existir uno o más autores" do
     expect(@libro.autores.size).to be >= 1
   end
   
end
