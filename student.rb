require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, parent_permission, name = 'Unknown')
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    owner.student.push(self) unless student.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
