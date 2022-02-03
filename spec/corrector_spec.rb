require './corrector'

describe Corrector do
  context 'when testing Corrector' do
    it 'creates a new instance of Corrector' do
      corrector = Corrector.new
      expect(corrector.correct_name('alishashahahsaha')).to eq 'Alishashah'
    end
  end
end