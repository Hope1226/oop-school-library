require './person'
require './student'
require './teacher'
require 'colorize'

class PersonCreator
  attr_accessor :people_list

  def initialize
    @people_list = []
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '.blue
    status = gets.chomp
    print 'Age: '.blue
    age = gets.chomp
    print 'Name: '.blue
    name = gets.chomp
    if status == '1'
      print 'Has a parent permission? [Y/N] '.blue
      permission = gets.chomp.downcase
      @people_list << Student.new(age, name, parent_permission: permission == 'y')
      puts 'Student has been created successfully'.green
    else
      print 'Specialization: '.blue
      spec = gets.chomp
      @people_list << Teacher.new(spec, age, name)
      puts 'Teacher has been created successfully'.green
    end
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
