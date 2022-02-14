require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
  end

  def classroom=(classroom)
    @classroom = classroom
    owner.student.push(self) unless student.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
