require 'rails_helper'

describe 'Instructor Show Page' do
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

  it 'shows all instructor information' do
    visit '/students'

    within "#student-#{@john.id}" do
      click_link 'Mike'
    end

    expect(current_path).to eq("/instructors/#{@mike.id}")
    expect(page).to have_content(@mike.name)
    expect(page).to have_content('Students: John, Paul, George, and Ringo')
    expect(page).to have_content('Average Age of Students: 27.0')
  end
end
