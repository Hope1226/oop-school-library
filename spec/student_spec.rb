require './student'

describe Student do
  context 'When testin the student class' do
    it 'the students name should be correct' do
      student_test = Student.new(23, 'Jonny')
      expect(student_test.name).to eql 'Jonny'
    end

    it 'the student class should be instance of Person class' do
      student_test = Student.new(23, 'Jonny')
      expect(student_test).to be_kind_of(Person)
    end
  end
end
