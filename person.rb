class Person
  attr_reader :id

  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = rand(1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
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
end
