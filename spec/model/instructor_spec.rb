require 'rails_helper'

describe Instructor, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :instructor_students }
    it { should have_many(:students).through(:instructor_students) }
  end

  before :each do
    @john = Student.create!(name: 'John', age: '28')
    @paul = Student.create!(name: 'Paul', age: '27')
    @george = Student.create!(name: 'George', age: '22')
    @ringo = Student.create!(name: 'Ringo', age: '31')

    @mike = Instructor.create!(name: 'Mike')

    InstructorStudent.create!(instructor_id: @mike.id.to_s, student_id: @paul.id.to_s, cohort: 1908)
    InstructorStudent.create!(instructor_id: @mike.id.to_s, student_id: @john.id.to_s, cohort: 1908)
    InstructorStudent.create!(instructor_id: @mike.id.to_s, student_id: @george.id.to_s, cohort: 1908)
    InstructorStudent.create!(instructor_id: @mike.id.to_s, student_id: @ringo.id.to_s, cohort: 1908)
  end

  describe 'all_students' do
    it 'shows all students for that instructor' do
      expect(@mike.all_students).to eq(%w[John Paul George Ringo])
    end
  end

  describe 'average_age_of_students' do
    it 'shows average age of students for that instructor' do
      expect(@mike.average_age_of_students).to eq(27.0)
    end
  end
end
