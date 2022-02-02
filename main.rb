# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
require './classroom'
require './person_creator'
require './book_creator'
require './rental_creator'

class Main
  def initialize
    @person_creator = PersonCreator.new
    @book_creator = BookCreator.new
    @rental_creator = RentalCreator.new
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
      @rental_creator.create_rental(@book_creator.book_list, @person_creator.people_list)
      start
    when '6'
      @rental_creator.show_rentals_for_person(@person_creator.people_list)
      start
    when '7'
      @book_creator.preserve_book
      @person_creator.preserve_person
      puts 'See you soon!'
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
end

def run
  app = Main.new
  app.start
end

run
