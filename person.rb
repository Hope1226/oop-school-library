require './corrector'
require './rental'

class Person
  attr_reader :rentals

  attr_accessor :name, :age, :parent_permission, :id

  def initialize(age, name = 'Unknown', id = rand(1000), parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  private

  # Private methonds go here

  def of_age?
    @age >= 18
  end

  public

  # Public methonds go here

  def can_use_services?
    of_age? || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def add_rental(rental)
    @rentals << rental
    rental.person = self
  end
end
