require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'Unknown', id = rand(100))
    super(age, name, id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
