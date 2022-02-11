require './person'
require './student'
require './teacher'
require './book'
require './rental'

class App
    def initialize
        @books = []
        @people = []
        @rentals = []
    end

    def run
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
    
  def list_books
    @people.each { |person| puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
    puts 'people list'
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    has_permission = gets.chomp

    student = Student.new(classroom: @classroom, age: age, name: name, parent_permission : parent_permission == 'Y')
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

