require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before(:each) do
    @c = Classroom.new 'label'
  end

  context 'Classroom instanitiation' do
    it '#new' do
      expect(@c).to be_a Classroom
    end
  end

  context 'Add student to class' do
    it 'add student' do
      s = Student.new age: 12, classroom: @c
      @c.add_student(s)
      expect(@c.students.length).to be(1)
    end
  end
end
