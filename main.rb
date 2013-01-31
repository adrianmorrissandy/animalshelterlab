require 'pry'
require 'rainbow'

require_relative 'pets'
require_relative 'client'
require_relative 'shelter'

shelter = Shelter.new("HappiTails Shelter")

p1 = Pet.new("Fido", "Terrier", 2, "Male", ["Bones", "Shoes"])
p2 = Pet.new("Fluffy", "Terrier", 2, "Male", ["Bones", "Shoes"])
p3 = Pet.new("Sally", "Terrier", 2, "Male", ["Bones", "Shoes"])

c1 = Client.new("Ann", rand(20..50), "female")
c2 = Client.new("Sarah", rand(20..50), "female")
c3 = Client.new("Molly", rand(20..50), "female")

shelter.client[c1.name] = c1

binding.pry