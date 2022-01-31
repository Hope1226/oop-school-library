require './book'

class BookCreator
  attr_accessor :book_list

  def initialize
    @book_list = []
  end

  def create_book
    print 'Title: '.blue
    title = gets.chomp
    print 'Author: '.blue
    author = gets.chomp
    @book_list << Book.new(title, author)
    puts "Book: '#{title}' has been created successfully".green
  end

  def show_book_list
    if @book_list.empty?
      puts '( No Books Found )'.red
    else
      @book_list.each_with_index.map do |book, index|
        puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}".yellow
      end
    end
  end
end
