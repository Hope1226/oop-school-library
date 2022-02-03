require './classroom'

describe Classroom do
  context 'when testing classroom' do
    it 'creates a new instance of Classroom' do
      maths = Classroom.new('maths')
      expect(maths.label).to eq 'maths'
    end
  end
end
