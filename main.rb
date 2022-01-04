require './student'
require './teacher'
require './book'
require './rental'

class CreateClass
  def initialize(list_handler)
    @list_handler = list_handler
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    b = Book.new(title, author)
    @list_handler.books.push(b)
    puts 'Book created successfully'
    puts
  end
end

class Main
  def initialize
    @list_handler = ListClass.new
    @create_handler = CreateClass.new(@list_handler)
  end

  def print_guide
    puts 'Please choose an option by entering a number'
    puts '1- List all books'
    puts '2- List all people'
    puts '3- Create a person'
    puts '4- Create a book'
    puts '5- Create a rental'
    puts '6- List all rentals for a given person id '
    puts '7- exit'
  end

  def all_prints
    loop do
      print_guide
      input = gets.chomp
      case input
      when '1'
        @list_handler.list_books
      when '2'
        @list_handler.list_people
      when '3', '4'
        @create_handler.create_book_or_person(input)
      when '5'
        @create_handler.create_rental
      when '6'
        @list_handler.list_rentals_for_person
      when '7'
        break
      end
    end
  end
end

a = Main.new
a.all_prints
