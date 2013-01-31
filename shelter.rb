require 'pry'

class Shelter
  attr_accessor :shelter_name, :pets, :client
  def initialize(shelter_name)
  @shelter_name = shelter_name
  @pets = {}
  @client = {}
end


def to_s
"#{shelter_name} is the name"
end
end