require_relative '../person'

describe Person do
    before(:each) do
        @p = Person.new 12
    end

    context "Person instanitiation" do
        it "#new" do
            expect(@p).to be_a Person
        end
    end
end
