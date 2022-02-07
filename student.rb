require "./person.rb"

class Student < Person
  def initialize(classroom, name = "Unknown")
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end