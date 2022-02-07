require "./person.rb"

class Teacher < Person
  def initialize(specialization, name = "Unknown", age, parent_permission)
    super(age, name = "unknown", parent_permission = true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end