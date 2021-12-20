class Person
    attr_reader :id, :name, :age
    attr_writer :name, :age
    
    def initialize (name = "unknown" , age, parent_permission = true)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
    end    
    
end