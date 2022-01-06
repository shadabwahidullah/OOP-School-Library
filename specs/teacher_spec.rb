require_relative '../teacher'

describe Teacher do
  before(:each) do
    @t = Teacher.new age: 12, specialization: double('something')
  end

  context 'Teacher instanitiation' do
    it '#new' do
      expect(@t).to be_a Teacher
    end
  end

  context 'Test Methods' do
    it 'Check can_use_services?' do
      expect(@t.can_use_services?).to be true
    end
  end
end
