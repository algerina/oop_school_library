require "./person.rb"

class Student < Person
  def initialize(classroom, name = "Unknown", age, parent_permission)
    super(age, name = "unknown", parent_permission = true)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end