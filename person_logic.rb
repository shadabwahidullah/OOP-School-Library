require_relative "./list_middleware"
require_relative "./student"
require_relative "./teacher"

class PersonLogic
  def initialize(list_handler)
    @list_handler = list_handler
  end
  def list_people
    @list_handler.people.each { |person| puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
    puts
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [input_number]'
    tmp = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    case tmp
    when '1'
      print 'Has Parent Permission Y/N'
      has_parent_permission = gets.chomp
      object = Student.new(age, 12, name, parent_permission: has_parent_permission)
    when '2'
      print 'Specialization: '
      specialization = gets.chomp
      object = Teacher.new(age, specialization, name)
    end
    @list_handler.people.push(object)
    puts 'Person created successfully'
  end
end
