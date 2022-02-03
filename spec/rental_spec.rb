require './rental'

describe Rental do
  context 'when testing Rental' do
    it 'creates a new instance of Rental' do
      rental1 = Rental.new('21/2/2022')
      expect(rental1.date).to eq('21/2/2022')
    end
  end
end
