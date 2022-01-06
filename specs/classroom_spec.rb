require_relative '../classroom'

describe Classroom do
    before( :each) do
        @c = Classroom.new "label"
    end

    context "Classroom instanitiation" do
        it "#new" do
            expect(@c).to be_a Classroom
        end
    end
end