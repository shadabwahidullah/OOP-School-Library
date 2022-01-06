require_relative '../book'
require_relative '../rental'
require_relative '../person'

describe Book do
    before (:each) do 
        @b = Book.new title: "something", author: "someone"
    end

    context 'create a new book' do
        it '#new' do
            expect(@b).to have_attributes( :title => "something", :author => "someone", :rentals => [])
        end
    end

    context 'add a rental ' do
        it 'add rental' do
            bo = Book.new title: "something", author: "someone"
            p = Person.new (12)
            r = Rental.new date: "2020/21/12", book: bo, person: p
            bo.add_rental(r)
            expect(bo.rentals.length).to be(1)
        end
    end
end