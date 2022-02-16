require_relative '../student'
require_relative '../person'

describe Student do
  student = Student.new(15, 'Student 1', parent_permission: false)
  context 'when created' do
    it 'should have name, age and parent_permission' do
      expect(student.age).to eq 15
      expect(student.name).to eq 'Student 1'
      expect(student.parent_permission).to be false
    end
  end
  context 'is an instance' do
    it 'of person' do
      expect(student).to be_kind_of(Person)
    end
  end

  describe '#play_hooky' do
    it "Should return  ¯\(ツ)/¯" do
      expect(student.play_hooky).to eq  "¯\(ツ)/¯"
    end
  end
end