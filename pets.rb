require 'rainbow'
class Pet
  attr_accessor :name, :breed, :age, :gender, :fav_toys
  def initialize(name, breed, age, gender, fav_toys = ["walks", "belly rubs"])
    @name = name
    @breed = breed
    @age = age
    @gender = gender
    @fav_toys = fav_toys
  end

  def to_s
    "#{@name}".color(:red) + " is a #{@age} year old #{@gender} #{@breed}. It loves: #{@fav_toys.join(', ')}."
  end
end
