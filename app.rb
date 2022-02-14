require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './classroom'
require_relative './prompt'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def display_ui
    puts 'Welcome to School Library App!\n'
    puts 'Please choose an option by entering a number'
    puts '1- List all books'
    puts '2- List all people'
    puts '3- Create a person'
    puts '4- Create a book'
    puts '5- Create a rental'
    puts '6- List al rentals for a given id'
    puts '7- exit'
  end

  def books_list
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    puts 'books list'
  end

  def people_list
    @people.each { |person| puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
    puts 'people list'
  end

  def create_student
    age = prompt('Age: ')
    name = prompt('Name: ')
    permission = prompt('Has parent permission? [Y/N]: ')
    student = Student.new(age, name, parent_permission: permission)
    puts 'Student created successfully'
    @people.push(student)
    puts
  end

  def create_teacher
    name = prompt('Name: ')
    specialization = prompt('Specialization: ')
    age = prompt('Age: ')
    teacher = Teacher.new(specialization, age, name)
    @people.push(teacher)
    puts 'Teacher created successfully'
    puts
  end

  def create_person
    user = prompt('Do you want to create a student(1) or a teacher(2)?')
    case user
    when '1'
      create_student
    when '2'
      create_teacher
    end
  end

  def create_book
    title = prompt('Title: ')
    author = prompt('Author: ')
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully!'
    puts
  end

  def create_rental
    print 'Please select a book from the following list: '
    @books.each_with_index { |book, index| puts "#{index} Title: #{book.title} Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Please select a person from the list'
    @people.each_with_index do |person, index|
      puts "[#{index}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    date = prompt('Date: ')
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals.push(rental)
    puts 'Rental created successfully'
    puts
  end

  def rentals_list_for_person
    person_id = prompt('Person ID: ').to_i
    puts 'Rentals: '
    @rentals.each do |rental|
      puts "Date: #{rental.date} Book: #{rental.book.title} by: #{rental.book.author}" if rental.person.id == person_id
    end
  end

  def run
    loop do
      display_ui
      input = gets.chomp
      case input
      when '1'
        books_list
      when '2'
        people_list
      when '3'
        create_person
      when '4'
        create_book
      when '5'
        create_rental
      when '6'
        rentals_list_for_person
      else
        break
      end
    end
  end
end
