require_relative '../person'
require_relative '../rental'

describe Person do
  before(:each) do
    @p = Person.new 12
  end

  context 'Person instanitiation' do
    it '#new' do
      expect(@p).to be_a Person
    end
  end

  context 'Person Methods' do
    it '#can_use_services?' do
      expect(@p.can_use_services?).to be true
      mock_person = Person.new(12, parent_permission: false)
      expect(mock_person.can_use_services?).to be false
    end

    it '#validate_name' do
      # Call validation name before checking the name
      @p.validate_name
      mock_person = Person.new(12, 'aaaaaaaaaaa')
      mock_person.validate_name
      # Check the name if it was correctly validaded and corrected
      expect(@p.name).to eq 'Unknown'
      expect(mock_person.name).to eq 'Aaaaaaaaaa'
    end

    it '#add_rental' do
      # Create a rental
      rental = Rental.new date: '2021/12/12', book: 'Mock Book', person: @p
      @p.add_rental(rental)
      expect(@p.rentals.length).to be(1)
    end
  end
end
