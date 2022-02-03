require './rental'
require './display'

class RentalCreator
  include Display
  attr_accessor :rental_list

  def initialize(book_list, people_list)
    @rental_list = []
    if File.exist?('rentals.json')
      data = JSON.parse(File.read('rentals.json'))
      data.each do |obj|
        obj_data = JSON.parse(obj)
        new_rental = Rental.new(obj_data['date'])
        @rental_list << new_rental
        book_list.each do |book|
          book.add_rental(new_rental) if book.title == obj_data['book_title']
        end
        people_list.each do |person|
          person.add_rental(new_rental) if person.name == obj_data['person_name']
        end
      end
    else
      @rental_list = []
    end
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

  def preserve_rentals
    rental_data = @rental_list.map do |rental|
      JSON.generate({
                      date: rental.date,
                      book: rental.book,
                      person: rental.person,
                      book_title: rental.book.title,
                      person_name: rental.person.name
                    })
    end
    File.open('rentals.json', (File.empty?('rentals.json') ? 'a' : 'w').to_s) { |file| file.write(rental_data) }
  end
end
