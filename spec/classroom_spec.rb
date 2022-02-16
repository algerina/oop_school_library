require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context 'When created' do
    classroom = Classroom.new('101')
    it 'should have label' do
      expect(classroom.label).to eql '101'
    end
    it 'should not have students' do
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    classroom = Classroom.new('101')
    it 'should add new student to students array' do
      student = Student.new(12, 'Student')
      classroom.add_student(student)
      expect(classroom.students.length).to eq 1
      expect(classroom.students[0]).to be_instance_of(Student)
    end
  end
end
