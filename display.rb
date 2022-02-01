require 'colorize'

module Display
  def dis_create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '.blue
    status = gets.chomp
    print 'Age: '.blue
    age = gets.chomp
    print 'Name: '.blue
    name = gets.chomp
    if status == '1'
      print 'Has a parent permission? [Y/N] '.blue
      permission = gets.chomp.downcase
      puts 'Student has been created successfully'.green
      [status, age, name, permission]
    else
      print 'Specialization: '.blue
      spec = gets.chomp
      puts 'Teacher has been created successfully'.green
      [status, age, name, spec]
    end
  end

  def dis_create_book
    print 'Title: '.blue
    title = gets.chomp
    print 'Author: '.blue
    author = gets.chomp
    puts "Book: '#{title}' has been created successfully".green
    [title, author]
  end

  def dis_create_rental(book_list, people_list)
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
    puts 'Rental has been created successfully'.green
    [index_book, index_person, rent_date]
  end

  def dis_person_id
    print 'ID of person: '.blue
    gets.chomp.to_i
  end
end
