require_relative '../corrector'

describe Corrector do
    before (:each) do
        @corrector = Corrector.new
    end
    context 'create a new instance of corrector' do
        it '#new' do
            expect(@corrector).to be_a Corrector
        end
    end
end