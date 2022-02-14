def prompt(message)
  print message
  gets.chomp
end


def display_ui
  puts 'Please choose an option by entering a number'
  puts '1- List all books'
  puts '2- List all people'
  puts '3- Create a person'
  puts '4- Create a book'
  puts '5- Create a rental'
  puts '6- List al rentals for a given id'
  puts '7- exit'
  gets.chomp
end

