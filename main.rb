require 'pry'
require 'rainbow'

require_relative 'pets'
require_relative 'client'
require_relative 'shelter'

shelter = Shelter.new("HappiTails Shelter")

# ====================================================
# DON'T MIND ME; JUST INITIALIZING THE KENNEL!
# ====================================================

p1 = Pet.new("Fido", "Basenji", rand(1..9), "male", ["biscuits", "walks", "chew toys"])
p2 = Pet.new("Fluffy", "Terrier", rand(1..9), "female", ["children", "cats"])
p3 = Pet.new("Sally", "Pug", rand(1..9), "female", ["newspaper", "shoes"])
z1 = Pet.new("Rascal", "Dalmation", rand(1..9), "male", ["television"])
z2 = Pet.new("Davies", "Pointer", rand(1..9), "male", ["ducks", "chicken"])
z3 = Pet.new("Beverly", "Boxer", rand(1..9), "female", ["newspaper", "ducks"])
z4 = Pet.new("Max", "Beagle", rand(1..9), "male", ["sleeping", "teddy bears", "peanut butter"])

shelter.pets["#{p1.name.downcase}".to_sym] = p1
shelter.pets["#{p2.name.downcase}".to_sym] = p2
shelter.pets["#{p3.name.downcase}".to_sym] = p3

c1 = Client.new("Ann", rand(20..50), "female")
c2 = Client.new("Sarah", rand(20..50), "female", 1)
c3 = Client.new("Michael", rand(20..50), "male", 3)

shelter.client["#{c1.name.downcase}".to_sym] = c1
shelter.client["#{c2.name.downcase}".to_sym] = c2
shelter.client["#{c3.name.downcase}".to_sym] = c3

shelter.client[:ann].pets["#{z1.name.downcase}".to_sym] = z1
shelter.client[:sarah].pets["#{z2.name.downcase}".to_sym] = z2
shelter.client[:sarah].pets["#{z3.name.downcase}".to_sym] = z3
shelter.client[:michael].pets["#{z4.name.downcase}".to_sym] = z4

# shelter.client[:ann].pets[:fido] = shelter.pets[:fido]
# shelter.pets[:fido] = shelter.client[:ann].pets[:fido]

# ====================================================
# PRETTY MENU
# ====================================================

  print `clear`
  puts ("*" * 50).color(:blue)
  puts "Our Animals".upcase.center(50)
  shelter.pets.each_value do |p|
    puts p
  end
  puts ("*" * 50).color(:blue) + "\n\n"

  puts ("*" * 50).color(:green)
  puts "Our Adopters".upcase.center(50)
  shelter.client.each_key do |c|
    if shelter.client[c].pets.any?
      print "#{shelter.client[c].name}".color(:red) + ", who owns " + "#{shelter.client[c].pets.length}".color(:red) + " dog(s): "
      shelter.client[c].pets.each_value do |p|
        print p.name
        print " "
      end
      puts
    else
      puts "#{shelter.client[c].name}"
    end
  end
  puts ("*" * 50).color(:green) + "\n\n"

  puts "What would you like to do?"
  puts "Register a new (c)lient or (d)og"
  puts "or allow a current client to (a)dopt or (g)ive a pet."
  response = gets.chomp.downcase

# ====================================================
# HERE'S THE GOOD STUFF
# ====================================================

while response != 'q'


# ====================================================
# REGISTER A NEW CLIENT
# ====================================================

  if response == "c"
    puts "\nWelcome to #{shelter.name}!".color(:blue)
    print "What's your name? ".color(:yellow)
    name = gets.chomp.capitalize
    print "What's your age? ".color(:yellow)
    age = gets.to_i
    print "What's your gender? ".color(:yellow)
    gender = gets.chomp.downcase
    print "How many kids do you have? ".color(:yellow)
    kids = gets.to_i

    shelter.client["#{name.downcase}".to_sym] = Client.new(name, age, gender, kids)
    puts "Welcome to our shelter, #{name}!".color(:blue)
    gets
  end

# ====================================================
# REGISTER A NEW DOG
# ====================================================

  if response == "d"
    puts "And to whom am I speaking?"
    client = gets.chomp.downcase
    if shelter.client[client.to_sym]
      puts "\nWelcome back #{shelter.client[client.to_sym].name}!\n".color(:blue)
      print "What's your dog's name? ".color(:yellow)
      name = gets.chomp.capitalize
      print "What's your dog's age? ".color(:yellow)
      age = gets.to_i
      print "What's your dog's gender? ".color(:yellow)
      gender = gets.chomp.downcase
      print "What's your dogs breed? ".color(:yellow)
      breed = gets.chomp.capitalize

      shelter.client[client.to_sym].pets[name.downcase.to_sym] = Pet.new(name, breed, age, gender)
      puts "\nThanks!\n".color(:blue)
      gets
    else
      puts "Sorry. Something went wrong."
      gets
    end
  end

# ====================================================
# EXISTING CLIENT CAN ADOPT A REGISTERED DOG
# ====================================================

  if response == "a"
    puts "Who wants to adopt?"
    adopter = gets.chomp.downcase.to_sym
    if shelter.client[adopter]
      puts "What dog do you want to adopt?"
      adoptee = gets.chomp.downcase.to_sym
      if shelter.pets[adoptee]
        shelter.client[adopter].pets[adoptee] = shelter.pets[adoptee]
        shelter.pets.delete(adoptee)
        puts "#{shelter.client[adopter].name} now owns #{shelter.client[adopter].pets[adoptee].name}!"
        gets
      else
        puts "Sorry. Something went wrong."
        gets
      end
    else
      puts "Sorry. Something went wrong."
      gets
    end
  end

# ====================================================
# EXISTING CLIENT GIVES UP DOG :(
# ====================================================

  if response == "g"
    puts "Who wants to give up a pet? :("
    adopter = gets.chomp.downcase.to_sym
    if shelter.client[adopter]
      puts "What dog do you want to give up? :("
      adoptee = gets.chomp.downcase.to_sym
      if shelter.client[adopter].pets[adoptee]
        shelter.pets[adoptee] = shelter.client[adopter].pets[adoptee]
        shelter.client[adopter].pets.delete(adoptee)
        puts "#{shelter.client[adopter].name} gave up #{shelter.pets[adoptee].name} for adoption. :("
        gets
      else
        puts "Sorry. Something went wrong."
        gets
      end
    else
      puts "Sorry. Something went wrong."
      gets
    end
  end

# ====================================================
# PRETTY MENU
# ====================================================

  print `clear`
  puts ("*" * 50).color(:blue)
  puts "Our Animals".upcase.center(50)
  shelter.pets.each_value do |p|
    puts p
  end
  puts ("*" * 50).color(:blue) + "\n\n"

  puts ("*" * 50).color(:green)
  puts "Our Adopters".upcase.center(50)
  shelter.client.each_key do |c|
    if shelter.client[c].pets.any?
      print "#{shelter.client[c].name}".color(:red) + ", who owns " + "#{shelter.client[c].pets.length}".color(:red) + " dog(s): "
      shelter.client[c].pets.each_value do |p|
        print p.name
        print " "
      end
      puts
    else
      puts "#{shelter.client[c].name}"
    end
  end
  puts ("*" * 50).color(:green) + "\n\n"

  puts "What would you like to do?"
  puts "Register a new (c)lient or (d)og"
  puts "or allow a current client to (a)dopt or (g)ive a pet."
  response = gets.chomp.downcase

end