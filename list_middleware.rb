class ListClass
  def initialize(books_handler, rentals_handler, people_handler)
    @books = []
    @rentals = []
    @people = []
  end
  attr_accessor :people, :books, :rentals
end