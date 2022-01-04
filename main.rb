require './list_middleware'
require './person_logic'
require './book_logic'
require './rental_logic'

class Main
  def initialize
    @list_handler = ListClass.new
    @person_logic = PersonLogic.new(@list_handler)
    @book_logic = BookLogic.new(@list_handler)
    @rental_logic = RentalLogic.new(@list_handler)
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
        @book_logic.list_books
      when '2'
        @person_logic.list_people
      when '3'
        @person_logic.create_person
      when '4'
        @book_logic.create_book
      when '5'
        @rental_logic.create_rental
      when '6'
        @rental_logic.list_rentals_for_person
      when '7'
        break
      end
    end
  end
end

a = Main.new
a.all_prints
