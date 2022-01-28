# rubocop:disable Metrics/CyclomaticComplexity
require './book'
require './person'
require './student'
require './teacher'
require './classroom'
require 'colorize'

class Main
  attr_accessor :book_list, :people_list, :rental_list

  def initialize
    @book_list = []
    @people_list = []
    @rental_list = []
  end

  def start
    options = ['List all books', 'List all people', 'Create a person', 'Create a book', 'Create a rental',
               'List all rentals for a given person ID', 'Exit']
    puts "\n\nWelcome to School Library App! \n\nPlease choose an option by entering a number"
    options.each_with_index.map { |option, index| puts "#{index + 1} - #{option}" }
    user_option = gets.chomp
    execute_option(user_option)
  end

  def execute_option(option)
    case option
    when '1' then show_book_list
    when '2' then show_people_list
    when '3' then create_person
    when '4' then create_book
    when '5' then create_rental
    when '6' then show_rentals_for_person
    when '7' then puts 'See you soon!'
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity

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

    start
  end

  def create_book
    print 'Title: '.blue
    title = gets.chomp
    print 'Author: '.blue
    author = gets.chomp
    @book_list << Book.new(title, author)
    puts "Book: '#{title}' has been created successfully".green

    start
  end

  def show_book_list
    if @book_list.empty?
      puts '( No Books Found )'.red
    else
      @book_list.each_with_index.map do |book, index|
        puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}".yellow
      end
    end

    start
  end

  def show_people_list
    if @people_list.empty?
      puts '( No People Found )'.red
    else
      @people_list.each_with_index.map do |person, index|
        puts "#{index})[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}".yellow
      end
    end

    start
  end

  def create_rental
    puts 'Select a book from the following list by number'.blue
    @book_list.each_with_index.map do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}".yellow
    end
    index_book = gets.chomp.to_i
    puts 'Select a person from the following list by number'.blue
    @people_list.each_with_index.map do |person, index|
      puts "#{index})[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}".yellow
    end
    index_person = gets.chomp.to_i
    print 'Date: '.blue
    rent_date = gets.chomp
    rental = Rental.new(rent_date)
    @book_list[index_book].add_rental(rental)
    @people_list[index_person].add_rental(rental)
    @rental_list << rental
    puts 'Rental has been created successfully'.green
    start
  end

  def show_rentals_for_person
    print 'ID of person: '.blue
    person_id = gets.chomp.to_i
    person = @people_list.select { |target| target.id == person_id }[0]
    person.rentals.map { |rent| puts "Data: #{rent.date}, Book: \"#{rent.book.title}\", by #{rent.book.author}".yellow }
    start
  end
end

def run
  app = Main.new
  app.start
end

run
