require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknown')
    super(age, name)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
