class Person
  def initialize(age, name = 'unknown', parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, age
  attr_writer id

  def is_of_age?
    age >= 18
  end

  def can_use_services?
    age >= 18 || parent_permission == true
  end

  private :is_of_age?
end
