require './book'
require './rental'

describe Book do
  context 'When testing Book class' do
    it 'the book title should return the correct book title' do
      temp_book = Book.new('Rich Dad and Poor Dad', 'Robert Kiosaki')
      expect(temp_book.title).to eql 'Rich Dad and Poor Dad'
    end

    it 'the book rentals length should return 0' do
      temp_book = Book.new('Rich Dad and Poor Dad', 'Robert Kiosaki')
      expect(temp_book.rentals.length).to eql 0
    end

    it 'the add_rental method adds new rental class to the books rentals' do
      book_test = Book.new('Rich Dad and Poor Dad', 'Robert Kiosaki')
      renatl_test = Rental.new('22/02/2022')
      book_test.add_rental(renatl_test)
      expect(book_test.rentals.length).to eql 1
    end
  end
end
