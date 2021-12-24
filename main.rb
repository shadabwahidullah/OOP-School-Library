require './person'
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
    when '3'
        puts 'Do you want to create a student (1) or a teacher (2)? [input_number'
        tmp = gets.chomp
        if(tmp == '1')
            puts 'age'
            age = gets.chomp
            puts 'name'
            name = gets.chomp
            puts 'Has parent permission?'
            parent_permission = gets.chomp
            person = Person.new(age, name, parent_permission: parent_permission)
            puts 'Person Created successfully'
            puts person.name
        elsif (tmp == '2')
    
        end
    end
    
    if input == '7'
        break
    end
end


