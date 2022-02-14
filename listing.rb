module Listing
  def books_list
    puts 'Books List:'
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def people_list
    puts 'People List:'
    @people.each { |person| puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
  end

  def rentals_list_for_person
    person_id = prompt('Person ID: ').to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date} Book: #{rental.book.title} by: #{rental.book.author}" if rental.person.id == person_id
    end
  end
end
