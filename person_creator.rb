require './student'
require './teacher'
require './display'

class PersonCreator
  include Display
  attr_accessor :people_list

  def initialize
    if File.exist?('person.json')
      data = JSON.parse(File.read('person.json'))
      @people_list = data.map do |person|
        person_data = JSON.parse(person)
        if person_data['class'] == 'Student'
          Student.new(person_data['age'], person_data['name'], parent_permission: person_data['parent_permission'])
        else 
          Teacher.new(person_data['specialization'], person_data['age'], person_data['name'])
        end
      end
    else
      @people_list = []
    end
  end

  def create_person
    status, age, name, spec_permission = dis_create_person
    @people_list << (if status == '1'
                       Student.new(age, name,
                                   parent_permission: spec_permission == 'y')
                     else
                       Teacher.new(
                         spec_permission, age, name
                       )
                     end)
  end

  def show_people_list
    if @people_list.empty?
      puts '( No People Found )'.red
    else
      @people_list.each_with_index.map do |person, index|
        puts "#{index})[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}".yellow
      end
    end
  end

  def preserve_person
    person_data = @people_list.map do |person|
      if person.class.name == 'Student'
        JSON.dump({
          class: person.class,
          name: person.name,
          age: person.age,
          parent_permission: person.parent_permission
        })
      else
        JSON.dump({
          class: person.class,
          name: person.name,
          age: person.age,
          specialization: person.specialization
        })
      end
    end
    File.open('person.json', (File.empty?('person.json') ? 'a' : 'w').to_s) { |file| file.write(person_data) }
  end
end
