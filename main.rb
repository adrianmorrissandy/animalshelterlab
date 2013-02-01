require 'pry'
require 'rainbow'

require_relative 'data'
require_relative 'menu'
require_relative 'functions'

response = start

while response != 'q'

# ====================================================
# REGISTER A NEW CLIENT
# ====================================================

  if response == "c"
    new_client
  end

# ====================================================
# REGISTER A NEW DOG
# ====================================================

  if response == "d"
    new_dog
  end

# ====================================================
# EXISTING CLIENT CAN ADOPT A REGISTERED DOG
# ====================================================

  if response == "a"
    adopt
  end

# ====================================================
# EXISTING CLIENT GIVES UP DOG :(
# ====================================================

  if response == "g"
    give
  end

# ====================================================
# PRETTY MENU
# ====================================================

  response = start

end