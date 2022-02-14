require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

module CreateItem
  def create_student(name, age)
    permission = prompt('Has parent permission? [Y/N]: ')
    student = Student.new(age, name, parent_permission: permission)
    @people.push(student)
    print "Student created successfully\n\n"
  end

  def create_teacher(name, age)
    specialization = prompt('Specialization: ')
    teacher = Teacher.new(specialization, age, name)
    @people.push(teacher)
    print "Teacher created successfully\n\n"
  end

  def create_person
    option = prompt('Do you want to create a student(1) or a teacher(2)?')
    name = prompt('Name: ')
    age = prompt('Age: ')
    case option
    when '1'
      create_student(name, age)
    when '2'
      create_teacher(name, age)
    end
  end

  def create_book
    title = prompt('Title: ')
    author = prompt('Author: ')
    book = Book.new(title, author)
    @books.push(book)
    print "Book created successfully!\n\n"
  end

  def create_rental
    puts 'Please select a book from the following list:'
    @books.each_with_index { |book, index| puts "[#{index}] Title: #{book.title} Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Please select a person from the list'
    @people.each_with_index do |person, index|
      puts "[#{index}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    date = prompt('Date: ')
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals.push(rental)
    print "Rental created successfully\n\n"
  end
end
