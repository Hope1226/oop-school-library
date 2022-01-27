require './book'
require './person'
require './student'
require './teacher'
require './classroom'

class Main
  attr_accessor :book_list, :people_list, :rental_list

  def initialize
    @book_list = []
    @people_list = []
    @rental_list = []
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    status = gets.chomp
    print 'Age:'
    age = gets.chomp
    print 'Name:'
    name = gets.chomp
    if status == '1'
      print 'Has a parent permission? [Y/N]'
      permission = gets.chomp.downcase
      @people_list << Student.new(age, name, parent_permission: permission == 'y')
      print 'Student has been created successfully'
    else
      print 'Specialization:'
      spec = gets.chomp
      @people_list << Teacher.new(spec, age, name)
      print 'Teacher has been created successfully'
    end
  end
end

app = Main.new
app.create_person
