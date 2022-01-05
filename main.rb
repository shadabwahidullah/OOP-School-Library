require './list_middleware'
require './person_logic'
require './book_logic'
require './rental_logic'
require './file_manager'

class Main
  def initialize
    @file_manager = FileManager.new
    @list_handler = ListClass.new(@file_manager.load_all_data)
    @person_logic = PersonLogic.new(@list_handler)
    @book_logic = BookLogic.new(@list_handler)
    @rental_logic = RentalLogic.new(@list_handler)
  end

  def print_guide
    puts 'Please choose an option by entering a number'
    puts '1- List all books'
    puts '2- Create a book'
    puts '3- Create a person'
    puts '4- List all people'
    puts '5- Create a rental'
    puts '6- List all rentals for a given person id '
    puts '7- exit'
  end

  def people_caller(input)
    case input
    when 3
      @person_logic.create_person
    when 4
      @person_logic.list_people
    end
  end

  def book_caller(input)
    case input
    when 1
      @book_logic.list_books
    when 2
      @book_logic.create_book
    end
  end

  def rental_caller(input)
    case input
    when 5
      @rental_logic.create_rental
    when 6
      @rental_logic.list_rentals_for_person
    end
  end

  def logic_caller(input)
    case input
    when 1..2
      book_caller(input)
    when 3..4
      people_caller(input)
    when 5..6
      rental_caller(input)
    end
  end

  def all_prints
    loop do
      print_guide
      input = gets.chomp
      if input == '7'
        @file_manager.save_all_data(@list_handler.data_to_object)
        break
      end
      logic_caller(input.to_i)
    end
  end
end

a = Main.new
a.all_prints
