# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
require './classroom'
require './person_creator'
require './book_creator'

class Main
  attr_accessor :book_list, :rental_list

  def initialize
    @person_creator = PersonCreator.new
    @book_creator = BookCreator.new
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
    when '1'
      @book_creator.show_book_list
      start
    when '2'
      @person_creator.show_people_list
      start
    when '3'
      @person_creator.create_person
      start
    when '4'
      @book_creator.create_book
      start
    when '5'
      create_rental
      start
    when '6'
      show_rentals_for_person
      start
    when '7'
      puts 'See you soon!'
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength

  def create_rental
    puts 'Select a book from the following list by number'.blue
    @book_creator.book_list.each_with_index.map do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}".yellow
    end
    index_book = gets.chomp.to_i
    puts 'Select a person from the following list by number'.blue
    @person_creator.people_list.each_with_index.map do |person, index|
      puts "#{index})[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}".yellow
    end
    index_person = gets.chomp.to_i
    print 'Date: '.blue
    rent_date = gets.chomp
    rental = Rental.new(rent_date)
    @book_creator.book_list[index_book].add_rental(rental)
    @person_creator.people_list[index_person].add_rental(rental)
    @rental_list << rental
    puts 'Rental has been created successfully'.green
    start
  end

  def show_rentals_for_person
    print 'ID of person: '.blue
    person_id = gets.chomp.to_i
    person = @person_creator.people_list.select { |target| target.id == person_id }[0]
    person.rentals.map { |rent| puts "Data: #{rent.date}, Book: \"#{rent.book.title}\", by #{rent.book.author}".yellow }
    start
  end
end

def run
  app = Main.new
  app.start
end

run
