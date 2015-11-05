require 'spec_helper'

describe Bibliografia do
  
  before :each do
      @libro = Bibliografia::Referencia.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], 
      "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide",
      "(The Facets of Ruby)", "Pragmatic Bookshelf", "4 edition", "(July 7, 2013)",
      ["ISBN-13: 978-1937785499", "ISBN-10: 1937785491"])
   end
   
   it "Deben existir uno o más autores" do
     @libro.autores.size.should be >= 1
   end
   
end
