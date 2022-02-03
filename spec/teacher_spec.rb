require './teacher'

describe Teacher do
  context 'When testing the teacher class' do
    it 'the teacher\' specialization should be correct' do
      teacher_test = Teacher.new('Math', 23, 'Jonny Nesh')
      expect(teacher_test.specialization).to eql 'Math'
    end

    it 'the can_use_services should alwasy return true' do
      teacher_test = Teacher.new('Math', 23, 'Jonny Nesh')
      expect(teacher_test.can_use_services?).to be true
    end

    it 'the teacher class should be instance of Person class' do
      teacher_test = Teacher.new('Math', 23, 'Jonny Nesh')
      expect(teacher_test).to be_kind_of(Person)
    end
  end
end
