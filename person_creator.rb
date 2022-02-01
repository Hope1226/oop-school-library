require './student'
require './teacher'
require './display'

class PersonCreator
  include Display
  attr_accessor :people_list

  def initialize
    @people_list = []
  end

  def create_person
    status, age, name, spec_permission = dis_create_person
    @people_list << (if status == '1'
                       Student.new(age, name,
                                   parent_permission: spec_permission == 'y')
                     else
                       Teacher.new(
                         spec_permission, age, name
                       )
                     end)
  end

  def show_people_list
    if @people_list.empty?
      puts '( No People Found )'.red
    else
      @people_list.each_with_index.map do |person, index|
        puts "#{index})[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}".yellow
      end
    end
  end
end
