require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name, parent_permission: true)
    super(age, name, parent_permission)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
