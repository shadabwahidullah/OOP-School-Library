class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title:, author:, rentals: [])
    @title = title
    @author = author
    @rentals = rentals
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.book(self)
  end
end
