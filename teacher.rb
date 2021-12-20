require './person.rb'

class Teacher
    def initialize (age, specialization)
        super(age)
        @specialization = specialization
    end
    
    def can_use_services?
        true
    end
end