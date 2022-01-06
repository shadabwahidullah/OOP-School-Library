require_relative '../book'

describe Book do
    context 'create a new book' do
        it '#new' do
            b = Book.new title: "something", author: "someone"
            expect(b).to have_attributes( :title => "something", :author => "someone", :rentals => [])
        end
    end
end