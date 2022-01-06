require_relative '../student'

describe Student do
    before(:each) do
        @s = Student.new age:12, classroom: double('classroom')
    end

    context "Student instanitiation" do
        it "#new" do
            expect(@s).to be_a Student
        end
    end
end