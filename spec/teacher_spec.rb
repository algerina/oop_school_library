require_relative '../teacher'
require_relative '../person'

describe Teacher do
  teacher1 = Teacher.new('Maths', 51, 'Teacher 1')
  context 'when created' do
    it 'should have name, age and specialization' do
      expect(teacher1.age).to eq 51
      expect(teacher1.name).to eq 'Teacher 1'
      expect(teacher1.specialization).to eq 'Maths'
    end
  end
  context 'is an instance' do
    it 'of person' do
      expect(teacher1).to be_kind_of(Person)
    end
  end
  describe '#can_use_services?' do
    teacher2 = Teacher.new('Maths', 51, 'Teacher 1', parent_permission: true)
    teacher3 = Teacher.new('Maths', 51, 'Teacher 1', parent_permission: false)
    it 'can_use_services should always return true' do
      expect(teacher1.can_use_services?).to be true
      expect(teacher2.can_use_services?).to be true
      expect(teacher3.can_use_services?).to be true
    end
  end
end
