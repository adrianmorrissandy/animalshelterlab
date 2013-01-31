require 'pry'
require 'pry-debugger'



class Client

  attr_accessor :name , :age, :gender, :kids, :pets

  def initialize(name, age, gender, kids = 0)
    @name= name
    @age= age
    @gender= gender
    @pets= {}
    @kids= kids
  end


  def to_s
    "Client's name is : #{name}, age : #{age}, gender : #{gender}."
  end

end
