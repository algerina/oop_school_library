require_relative '../person'

describe Person do
  context 'When created' do
    it 'Should have age and name' do
      person = Person.new(18, 'Nina')
      expect(person.age).to eql(18)
      expect(person.name).to eql('Nina')
    end

    it 'Should have parent_permission' do
      person = Person.new(13, 'Moda', parent_permission: false)
      expect(person.parent_permission).to be false
    end
  end

  describe '#can_use_services?' do
    context 'Under 18 without parent permission' do
      it 'Should return false' do
        person = Person.new(11, 'Lila', parent_permission: false)
        expect(person.can_use_services?).to be false
      end
    end

    context 'Over 18 without parent permission' do
      it 'Should return true' do
        person = Person.new(19, 'Amel', parent_permission: false)
        expect(person.can_use_services?).to be true
      end
    end

    context 'Under 18 with parent permission' do
      it 'Should return true' do
        person = Person.new(11, 'Lila', parent_permission: true)
        expect(person.can_use_services?).to be true
      end
    end

    context 'Over 18 with parent permission' do
      it 'Should return true' do
        person = Person.new(19, 'Amel', parent_permission: true)
        expect(person.can_use_services?).to be true
      end
    end
  end
end
