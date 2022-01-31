require './person_creator'
require './book_creator'
require './rental'

class RentalCreator
  attr_accessor :rental_list

  def initialize
    @rental_list = []
  end

  def create_rental(book_list, people_list)
    puts 'Select a book from the following list by number'.blue
    book_list.each_with_index.map do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}".yellow
    end
    index_book = gets.chomp.to_i
    puts 'Select a person from the following list by number'.blue
    people_list.each_with_index.map do |person, index|
      puts "#{index})[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}".yellow
    end
    index_person = gets.chomp.to_i
    print 'Date: '.blue
    rent_date = gets.chomp
    rental = Rental.new(rent_date)
    book_list[index_book].add_rental(rental)
    people_list[index_person].add_rental(rental)
    @rental_list << rental
    puts 'Rental has been created successfully'.green
  end

  def show_rentals_for_person(people_list)
    print 'ID of person: '.blue
    person_id = gets.chomp.to_i
    person = people_list.select { |target| target.id == person_id }[0]
    person.rentals.map { |rent| puts "Data: #{rent.date}, Book: \"#{rent.book.title}\", by #{rent.book.author}".yellow }
  end
end
