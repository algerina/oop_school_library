require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './classroom'

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
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    student = Student.new(classroom: @classroom, age: age, name: name, parent_permission: permission)
    puts 'Student created successfully'
    @people.push(student)
    puts
  end

  def create_teacher
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    print 'Age: '
    age = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
    puts 'Teacher created successfully'
    puts
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)?'
    user = gets.chomp
    case user
    when '1'
      create_student
    when '2'
      create_teacher
    end
  end

  def create_book
    print 'Title: '
    title = gets.chompprint 'Author: '
    author = gets.chomp
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
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals.push(rental)
    puts 'Rental created successfully'
    puts
  end

  def rentals_list_for_person
    print 'Person ID: '
    person_id = gets.chomp.to_i
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
        print 'Thank you for using School Library!'
        break
      end
    end
  end
  
end
