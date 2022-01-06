require_relative '../rental'

describe Rental do
  before(:each) do
    @t = Rental.new date: 2020 / 12 / 12, book: double('somebook'), person: double('someperson')
  end

  context 'Rental instanitiation' do
    it '#new' do
      expect(@t).to be_a Rental
    end
  end
end
