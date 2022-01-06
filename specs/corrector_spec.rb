require_relative '../corrector'

describe Corrector do
  before(:each) do
    @corrector = Corrector.new
  end
  context 'create a new instance of corrector' do
    it '#new' do
      expect(@corrector).to be_a Corrector
    end
  end

  context 'correct name' do
    it 'try correct name' do
      mock_name = 'aaaaaaaaaaa'
      corrected_name = @corrector.correct_name(mock_name)
      expect(corrected_name).to eq 'Aaaaaaaaaa'
    end
  end
end
