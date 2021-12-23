require './person'
require './corrector'

class Teacher < Person
  def initialize(age, specialization, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
    @Corrector = Corrector.new
  end

  def can_use_services?
    true
  end
end

puts Teacher.new(17, 'something', 'wahidullah').validate_name
