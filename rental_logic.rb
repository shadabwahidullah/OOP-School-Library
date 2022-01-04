require_relative './rental'

class RentalLogic
  def initialize(list_handler)
    @list_handler = list_handler
  end

  def list_rentals_for_person
    print 'ID of person: '
    id_of_person = gets.chomp.to_i
    puts 'Rentals:'
    @list_handler.rentals.each do |rent|
      puts "Date: #{rent.date}, Book #{rent.book.title} by #{rent.book.author}" if rent.person.id == id_of_person
    end
    puts
  end

  def select_rental(iterable, item)
    puts "Select a #{item} from the following list:"
    case item
    when 'book'
      iterable.each_with_index { |b, idx| puts "[#{idx}] Title: #{b.title}, Author: #{b.author}" }
    when 'person'
      iterable.each_with_index do |person, idx|
        puts "[#{idx}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    print 'Select a number: '
    input = gets.chomp.to_i
    iterable[input]
  end

  def create_rental
    book = select_rental(@list_handler.books, 'book')
    person = select_rental(@list_handler.people, 'person')
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, book, person)
    @list_handler.rentals.push(rental)
    puts 'Rental created successfully'
    puts
  end
end
