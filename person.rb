require_relative './corrector'
require_relative './rental'

class Person
  attr_accessor :name, :age
  attr_reader :id, :rentals, :parent_permission

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def of_age?
    age >= 18
  end

  def can_use_services?
    age >= 18 || parent_permission == true
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  private :of_age?
end
