require 'rails_helper'

describe 'Students Index Page' do
  before :each do
    @john = Student.create!(name: 'John', age: '28')
    @paul = Student.create!(name: 'Paul', age: '27')
    @george = Student.create!(name: 'George', age: '22')
    @ringo = Student.create!(name: 'Ringo', age: '31')

    @mike = Instructor.create!(name: 'Mike')
    @meg = Instructor.create!(name: 'Meg')

    InstructorStudent.create!(instructor_id: @mike.id.to_s, student_id: @paul.id.to_s, cohort: 1908)
    InstructorStudent.create!(instructor_id: @mike.id.to_s, student_id: @john.id.to_s, cohort: 1908)
    InstructorStudent.create!(instructor_id: @mike.id.to_s, student_id: @george.id.to_s, cohort: 1908)
    InstructorStudent.create!(instructor_id: @mike.id.to_s, student_id: @ringo.id.to_s, cohort: 1908)

    InstructorStudent.create!(instructor_id: @meg.id.to_s, student_id: @paul.id.to_s, cohort: 1908)
    InstructorStudent.create!(instructor_id: @meg.id.to_s, student_id: @john.id.to_s, cohort: 1908)
    InstructorStudent.create!(instructor_id: @meg.id.to_s, student_id: @george.id.to_s, cohort: 1908)
    InstructorStudent.create!(instructor_id: @meg.id.to_s, student_id: @ringo.id.to_s, cohort: 1908)
  end

  it 'can list all students' do
    visit '/students'

    within "#student-#{@john.id}" do
      expect(page).to have_content(@john.name)
      expect(page).to have_content('Cohort: 1908')
      expect(page).to have_content('Instructors: Mike Meg')
    end

    within "#student-#{@paul.id}" do
      expect(page).to have_content(@paul.name)
      expect(page).to have_content('Cohort: 1908')
      expect(page).to have_content('Instructors: Mike Meg')
    end

    within "#student-#{@george.id}" do
      expect(page).to have_content(@george.name)
      expect(page).to have_content('Cohort: 1908')
      expect(page).to have_content('Instructors: Mike Meg')
    end

    within "#student-#{@ringo.id}" do
      expect(page).to have_content(@ringo.name)
      expect(page).to have_content('Cohort: 1908')
      expect(page).to have_content('Instructors: Mike Meg')
    end
  end
end
