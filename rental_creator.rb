require './rental'
require './display'

class RentalCreator
  include Display
  attr_accessor :rental_list

  def initialize
    @rental_list = []
  end

  def create_rental(book_list, people_list)
    index_book, index_person, rent_date = dis_create_rental(book_list, people_list)
    rental = Rental.new(rent_date)
    book_list[index_book].add_rental(rental)
    people_list[index_person].add_rental(rental)
    @rental_list << rental
  end

  def show_rentals_for_person(people_list)
    person_id = dis_person_id
    person = people_list.select { |target| target.id == person_id }[0]
    person.rentals.map { |rent| puts "Data: #{rent.date}, Book: \"#{rent.book.title}\", by #{rent.book.author}".yellow }
  end
end
