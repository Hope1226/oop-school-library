require './book'
require './display'

class BookCreator
  include Display
  attr_accessor :book_list

  def initialize
    @book_list = []
  end

  def create_book
    title, author = dis_create_book
    @book_list << Book.new(title, author)
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
