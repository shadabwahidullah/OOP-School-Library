require_relative '../book'

describe Book do
    before (:each) do 
        @b = Book.new title: "something", author: "someone"
    end

    context 'create a new book' do
        it '#new' do
            expect(@b).to have_attributes( :title => "something", :author => "someone", :rentals => [])
        end
    end
end