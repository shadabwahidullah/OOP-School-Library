class ListClass
  def initialize(data_object)
    @books = data_object[:books]
    @rentals = data_object[:rentals]
    @people = data_object[:people]
  end
  attr_accessor :people, :books, :rentals

  def get_data_object()
    output = {
      people: @people,
      books: @books,
      rentals: @rentals
    }
    return output
  end
end
