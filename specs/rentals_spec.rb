require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe Rental do
  before(:each) do
    @t = Rental.new date: 2020 / 12 / 12, book: double('somebook'), person: double('someperson')
  end

  context 'Rental instantiation' do
    it '#new' do
      expect(@t).to be_a Rental
    end
  end

  context 'Adding Book and Person to the rental' do
    it 'Adding a Book to the rental' do
      @t.book = Book.new title: 'something', author: 'someone'
      expect(@t.book).to be_a Book
    end

    it 'Adding a Person to the rental' do
      @t.person = Person.new(12)
      expect(@t.person).to be_a Person
    end
  end
end
