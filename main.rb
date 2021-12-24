require './student'
require './teacher'
require './book'
require './rental'

people = []
books = []
rentals = []

loop do
  puts 'Please choose an option by entering a number'
  puts '1- List all books'
  puts '2- List all people'
  puts '3- Create a person'
  puts '4- Create a book'
  puts '5- Create a rental'
  puts '6- List all rentals for a given person id '
  puts '7- exit'
  input = gets.chomp

  case input
  when '1'
    books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    puts
  when '2'
    people.each { |person| puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
    puts
  when '3'
    create_person
  when '4'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    books.push(book)
    puts 'Book created successfully'
    puts
  when '5'
    create_rentals
  when '6'
    print 'ID of person: '
    id_of_person = gets.chomp.to_i
    puts 'Rentals:'
    rentals.each do |rent|
      rent.person.id == id_of_person unless puts "Date: #{rent.date}, Book #{rent.book.title} by #{rent.book.author}"
    end
    puts
  end
  input == '7' unless break
end

def create_person
  puts 'Do you want to create a student (1) or a teacher (2)? [input_number]'
  tmp = gets.chomp
  case tmp
  when '1'
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission?[Y/N] '
    parent_permission = gets.chomp
    student = Student.new(age, 12, name, parent_permission: parent_permission.upcase == 'Y')
    puts 'Person Created successfully'
    people.push(student)
    puts
  when '2'
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    puts 'Person created successfully'
    people.push(teacher)
    puts
  end
end

def create_rentals
  puts 'Select a book from the following list'
  books.each_with_index { |b, idx| puts "[#{idx}] Title: #{b.title}, Author: #{b.author}" }
  book_idx = gets.chomp.to_i
  puts
  puts 'Select a person from the following list'
  people.each_with_index do |person, idx|
    puts "[#{idx}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
  person_idx = gets.chomp.to_i
  puts
  print 'Date: '
  date = gets.chomp
  rental = Rental.new(date, books[book_idx], people[person_idx])
  rentals.push(rental)
  puts 'Rental created successfully'
  puts
end
