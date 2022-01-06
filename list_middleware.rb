require './student'
require './teacher'
require './book'
require './rental'

class ListClass
  def initialize(data_object)
    @books = parse_array(data_object[:books])
    @people = parse_array(data_object[:people])
    @rentals = parse_array(data_object[:rentals])
  end
  attr_accessor :people, :books, :rentals

  def data_to_object()
    {
      people: @people,
      books: @books,
      rentals: @rentals
    }
  end

  def json_to_object(object)
    map = {
      'Student' => Student,
      'Teacher' => Teacher,
      'Book' => Book,
      'Rental' => Rental
    }
    if object[:identifier] == 'Rental'
      rental_loader_handler(object)
    else
      map[object[:identifier]].new(**object.reject do |key, _value|
                                       %w[id rentals identifier].include?(key.to_s)
                                     end)
    end
  end

  def rental_loader_handler(object)
    found_book = @books.find { |book| book.title == object[:book][:title] }
    found_person = @people.find { |person| person.name == object[:person][:name] }
    object_to_use = {
      book: found_book,
      person: found_person,
      date: object[:date]
    }
    Rental.new(**object_to_use)
  end

  def parse_array(array)
    output = []
    array.each do |item|
      output.push(json_to_object(item))
    end
    output
  end
end
