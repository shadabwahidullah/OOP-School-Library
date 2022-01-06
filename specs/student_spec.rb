require_relative '../student'
require_relative '../classroom'

describe Student do
  before(:each) do
    @s = Student.new age: 12, classroom: double('classroom')
  end

  context 'Student instantiation' do
    it '#new' do
      expect(@s).to be_a Student
    end
  end

  context 'Test methods' do
    it 'Play Hooky' do
      output = @s.play_hooky
      expect(output).to eq "¯\(ツ)/¯"
    end
    it 'Set Classroom method' do
      mock_classroom = Classroom.new 'Mock Classroom'
      @s.classroom = mock_classroom
      expect(@s.classroom.label).to eq 'Mock Classroom'
    end
  end
end
