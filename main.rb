require './student'
require './teacher'
require './book'
require './rental'

class ListClass
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  attr_accessor :people, :books, :rentals

  def list_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    puts
  end

  def list_people
    @people.each { |person| puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
    puts
  end

  def list_rentals_for_person
    print 'ID of person: '
    id_of_person = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rent|
      puts "Date: #{rent.date}, Book #{rent.book.title} by #{rent.book.author}" if rent.person.id == id_of_person
    end
    puts
  end
end

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

  def create_rental
    puts 'Select a book from the following list'
    @list_handler.books.each_with_index { |b, idx| puts "[#{idx}] Title: #{b.title}, Author: #{b.author}" }
    book_idx = gets.chomp.to_i
    puts 'Select a person from the following list'
    @list_handler.people.each_with_index do |person, idx|
      puts "[#{idx}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_idx = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @list_handler.books[book_idx], @list_handler.people[person_idx])
    @list_handler.rentals.push(rental)
    puts 'Rental created successfully'
    puts
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission?[Y/N] '
    parent_permission = gets.chomp
    student = Student.new(age, 12, name, parent_permission: parent_permission == 'y')
    puts 'Person Created successfully'
    @list_handler.people.push(student)
    puts
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    puts 'Person created successfully'
    @list_handler.people.push(teacher)
    puts
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [input_number]'
    tmp = gets.chomp
    case tmp
    when '1'
      create_student
    when '2'
      create_teacher
    end
  end

  def create_book_or_person(input)
    case input
    when '3'
      create_person
    when '4'
      create_book
    end
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
