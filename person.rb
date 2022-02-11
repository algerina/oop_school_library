class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @retals = []
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
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
