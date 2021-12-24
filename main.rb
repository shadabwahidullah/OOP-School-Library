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
        puts 'input is 1'
        books.each {|book| puts "Title: #{book.title}, Author: #{book.author}"}
        puts
    when '2'
    when '3'
        puts 'Do you want to create a student (1) or a teacher (2)? [input_number]'
        tmp = gets.chomp
        if(tmp == '1')
            puts 'age'
            age = gets.chomp
            puts 'name'
            name = gets.chomp
            puts 'Has parent permission?[Y/N]'
            parent_permission = gets.chomp
            student = Student.new(age, 12, name, parent_permission: parent_permission.upcase =='Y' ? true : false)
            puts 'Person Created successfully'
            people.push(student)
            puts people[0]
        elsif (tmp == '2')
            puts 'age'
            age = gets.chomp
            puts 'name'
            name = gets.chomp
            puts 'Specialization'
            specialization = gets.chomp
            teacher = Teacher.new(age, specialization, name)
            puts 'Person created successfully'
            people.push(teacher)
            puts people[0]
        end
    when '4'
        print 'Title: '
        title = gets.chomp
        print 'Author: '
        author = gets.chomp
        book = Book.new(title, author)
        books.push(book)
        puts 'Book created successfully'
        puts books[0].title
    when '5'
        puts 'Select a book from the following list'
        books.each_with_index {|book, idx| puts "[#{idx}]Title: #{book.title}, Author: #{book.author}"}
        bookIdx = gets.chomp.to_i
        puts
        puts 'Select a person from the following list'
        people.each_with_index{|person, idx| puts "[#{idx}] (#{}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"}
        personIdx = gets.chomp.to_i
        puts
        print 'Date: '
        date = gets.chomp
        rental = Rental.new(date, books[bookIdx], people[personIdx])
        rentals.push(rental)
        puts 'Rental created successfully'
        puts 

    when '6'
    end
    
    if input == '7'
        break
    end
end


