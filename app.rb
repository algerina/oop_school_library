require 'json'
require './book'
require_relative './prompt'
require_relative './listing'
require_relative './create_item'

class App
  include Listing
  include CreateItem

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def load_data(file)
    JSON.parse(File.read(file)) if File.exist?(file) && File.size(file).positive?
  end

  def load_books
    load_data('./data/books.json').each { |book| @books.push(Book.new(book['title'], book['author'])) }
  end

  def load_people
    load_data('./data/people.json').each do |person|
      if person.key?('specialization')
        @people.push(Teacher.new(person['specialization'], person['age'], person['name']))
      else
        @people.push(Student.new(person['age'], person['name'], parent_permission: person['parent_permission']))
      end
    end
  end

  def write_books()
    books_data = @books.map { |book| { title: book.title, author: book.author } }
    File.write('./data/books.json', JSON.dump(books_data))
  end

  def write_people()
    people_data = @people.map do |person|
      case person.class.name
      when 'Student'
        { name: person.name, age: person.age, parent_permission: person.parent_permission }
      when 'Teacher'
        { name: person.name, age: person.age, specialization: person.specialization }
      end
    end
    File.write('./data/people.json', JSON.dump(people_data))
  end

  def run
    print "Welcome to School Library App!\n\n"
    loop do
      input = display_ui
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
