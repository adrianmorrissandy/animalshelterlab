require 'pry'

class Shelter
  attr_accessor :name, :pets, :client
  def initialize(name)
  @name = name
  @pets = {}
  @client = {}
end


def to_s
"#{shelter_name} is the name"
end
end