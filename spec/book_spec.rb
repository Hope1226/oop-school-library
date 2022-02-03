require './book'

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
  end
end
