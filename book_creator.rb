require './book'
require './display'
require 'json'

class BookCreator
  include Display
  attr_accessor :book_list

  def initialize
    if File.exist?('books.json')
      data = JSON.parse(File.read('books.json'))
      @book_list = data.map do |obj|
        obj_data = JSON.parse(obj)
        Book.new(obj_data['title'], obj_data['author'])
      end
    else
      @book_list = []
    end
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

  def preserve_book
    books_data = @book_list.map do |book|
      JSON.dump({
                  title: book.title,
                  author: book.author
                })
    end
    File.open('books.json', (File.empty?('books.json') ? 'a' : 'w').to_s) { |file| file.write(books_data) }
  end
end
