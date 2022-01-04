require_relative './list_middleware'
require_relative './student'
require_relative './teacher'

class PersonLogic
  def initialize(list_handler)
    @list_handler = list_handler
  end

  def list_people
    @list_handler.people.each { |person| puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
    puts
  end

  def user_input
    puts 'Do you want to create a student (1) or a teacher (2)? [input_number]'
    tmp = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    differentiator([tmp, age, name])
  end

  def differentiator(input_array)
    case input_array[0]
    when '1'
      print 'Has Parent Permission Y/N '
      has_parent_permission = gets.chomp
      input_array.push(has_parent_permission)
      input_array
    when '2'
      print 'Specialization: '
      specialization = gets.chomp
      input_array.push(specialization)
      input_array
    end
  end

  def create_person
    input_array = user_input
    case input_array[0]
    when '1'
      object = Student.new(input_array[1], 12, input_array[2], parent_permission: input_array[3])
    when '2'
      object = Teacher.new(input_array[1], input_array[3], input_array[2])
    end
    @list_handler.people.push(object)
    puts 'Person created successfully'
  end
end
