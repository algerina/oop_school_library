require './person'

class Teacher < Person
  def initialize(specialization, _name = 'Unknown', age, _parent_permission)
    super(age, name = 'unknown', parent_permission = true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
