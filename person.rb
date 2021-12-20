class Person
  def initialize(age, name = 'unknown', parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  attr_reader :id, :name, :age
  attr_writer :name, :age

  def is_of_age?
    @age >= 18 ? true : false
  end

  def can_use_services?
    if is_of_age? || @parent_permission
      return true
    end
  end

  private :is_of_age?
end
