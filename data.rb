require_relative 'pets'
require_relative 'client'
require_relative 'shelter'

$shelter = Shelter.new("HappiTails Shelter")

$shelter.pets[:fido] = Pet.new("Fido", "Basenji", rand(1..9), "male", ["biscuits", "walks", "chew toys"])
$shelter.pets[:fluffy] = Pet.new("Fluffy", "Terrier", rand(1..9), "female", ["children", "cats"])
$shelter.pets[:sally] = Pet.new("Sally", "Pug", rand(1..9), "female", ["newspaper", "shoes"])

$shelter.client[:ann] = Client.new("Ann", rand(20..50), "female")
$shelter.client[:sarah] = Client.new("Sarah", rand(20..50), "female", 1)
$shelter.client[:michael] = Client.new("Michael", rand(20..50), "male", 3)

$shelter.client[:ann].pets[:rascal] = Pet.new("Rascal", "Dalmation", rand(1..9), "male", ["television"])
$shelter.client[:sarah].pets[:davies] = Pet.new("Davies", "Pointer", rand(1..9), "male", ["ducks", "chicken"])
$shelter.client[:sarah].pets[:beverly] = Pet.new("Beverly", "Boxer", rand(1..9), "female", ["newspaper", "ducks"])
$shelter.client[:michael].pets[:max] = Pet.new("Max", "Beagle", rand(1..9), "male", ["sleeping", "teddy bears", "peanut butter"])