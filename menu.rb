
def start
  print `clear`
  puts ("*" * 50).color(:blue)
  puts "Our Animals".upcase.center(50)
  $shelter.pets.each_value do |p|
    puts p
  end
  puts ("*" * 50).color(:blue) + "\n\n"

  puts ("*" * 50).color(:green)
  puts "Our Adopters".upcase.center(50)
  $shelter.client.each_key do |c|
    if $shelter.client[c].pets.any?
      print "#{$shelter.client[c].name}".color(:red) + ", who owns " + "#{$shelter.client[c].pets.length}".color(:red) + " dog(s): "
      $shelter.client[c].pets.each_value do |p|
        print p.name
        print " "
      end
      puts
    else
      puts "#{$shelter.client[c].name}"
    end
  end
  puts ("*" * 50).color(:green) + "\n\n"

  puts "What would you like to do?"
  puts "Register a new (c)lient or (d)og"
  puts "or allow a current client to (a)dopt or (g)ive a pet."
  response = gets.chomp.downcase
end