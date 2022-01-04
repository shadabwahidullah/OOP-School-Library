class ListClass
  def initialize
    @books = []
    @rentals = []
    @people = []
  end
  attr_accessor :people, :books, :rentals
end