require './person'
require './rental'

describe Person do
  context 'When testing a person class' do
    it 'the person name should return correct name' do
      person_test = Person.new(24, 'John Cena')
      expect(person_test.name).to eql 'John Cena'
    end

    it 'can_use_services? should return true if age is more then 18 or there is parrent permission' do
      person_test = Person.new(24, 'John Cena')
      expect(person_test.can_use_services?).to be true
    end

    it 'can_use_services? should return false if age is less then 18 and there is no parrent permission' do
      person_test = Person.new(13, 'John Cena Junior', parent_permission: false)
      expect(person_test.can_use_services?).to be false
    end

    it 'validate_name method should modify the given name by capitalizing and making its length eaqul to 10' do
      person_test = Person.new(23, 'juliohulioinglesias')
      person_test.validate_name
      expect(person_test.name).to eql 'Juliohulio'
    end

    it 'the add_rental method adds new rental class to the persons rentals' do
      person_test = Person.new(23, 'juliohulioinglesias')
      renatl_test = Rental.new('22/02/2022')
      person_test.add_rental(renatl_test)
      expect(person_test.rentals.length).to eql 1
    end
  end
end
