def new_client
    puts "\nWelcome to #{$shelter.name}!".color(:blue)
    print "What's your name? ".color(:yellow)
    name = gets.chomp.capitalize
    print "What's your age? ".color(:yellow)
    age = gets.to_i
    print "What's your gender? ".color(:yellow)
    gender = gets.chomp.downcase
    print "How many kids do you have? ".color(:yellow)
    kids = gets.to_i

    $shelter.client["#{name.downcase}".to_sym] = Client.new(name, age, gender, kids)
    puts "Welcome to our shelter, #{name}!".color(:blue)
    gets
end

def new_dog
    puts "And to whom am I speaking?"
    client = gets.chomp.downcase
    if $shelter.client[client.to_sym]
      puts "\nWelcome back #{$shelter.client[client.to_sym].name}!\n".color(:blue)
      print "What's your dog's name? ".color(:yellow)
      name = gets.chomp.capitalize
      print "What's your dog's age? ".color(:yellow)
      age = gets.to_i
      print "What's your dog's gender? ".color(:yellow)
      gender = gets.chomp.downcase
      print "What's your dogs breed? ".color(:yellow)
      breed = gets.chomp.capitalize

      $shelter.client[client.to_sym].pets[name.downcase.to_sym] = Pet.new(name, breed, age, gender)
      puts "\nThanks!\n".color(:blue)
      gets
    else
      puts "Sorry. Something went wrong."
      gets
    end
end

def adopt
    puts "Who wants to adopt?"
    adopter = gets.chomp.downcase.to_sym
    if $shelter.client[adopter]
      puts "What dog do you want to adopt?"
      adoptee = gets.chomp.downcase.to_sym
      if $shelter.pets[adoptee]
        $shelter.client[adopter].pets[adoptee] = $shelter.pets[adoptee]
        $shelter.pets.delete(adoptee)
        puts "#{$shelter.client[adopter].name} now owns #{$shelter.client[adopter].pets[adoptee].name}!"
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

def give
    puts "Who wants to give up a pet? :("
    adopter = gets.chomp.downcase.to_sym
    if $shelter.client[adopter]
      puts "What dog do you want to give up? :("
      adoptee = gets.chomp.downcase.to_sym
      if $shelter.client[adopter].pets[adoptee]
        $shelter.pets[adoptee] = $shelter.client[adopter].pets[adoptee]
        $shelter.client[adopter].pets.delete(adoptee)
        puts "#{$shelter.client[adopter].name} gave up #{$shelter.pets[adoptee].name} for adoption. :("
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