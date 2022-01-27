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
      puts 'Student has been created successfully'
    else
      print 'Specialization:'
      spec = gets.chomp
      @people_list << Teacher.new(spec, age, name)
      puts 'Teacher has been created successfully'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @book_list << Book.new(title, author)
    puts "Book: '#{title}' has been created successfully"
  end

  def create_rental
    puts 'Select a book from the following list by number'
    if @book_list.empty?
      puts '( No Books Found )'
    else
      @book_list.each_with_index.map do |book, index|
        puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
    index_book = gets.chomp.to_i
    if @people_list.empty?
      puts '( No People Found )'
    else
      @people_list.each_with_index.map do |person, index|
        puts "#{index})[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    index_person = gets.chomp.to_i
    print 'Data: '
    rent_date = gets.chomp
    rental = Rental.new(rent_date)
    @book_list[index_book].add_rental(rental)
    @people_list[index_person].add_rental(rental)
    @rental_list << rental
    puts 'Rental has been created successfully'
  end
end

app = Main.new
app.create_book
app.create_person
app.create_rental
p app.people_list
