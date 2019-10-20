require 'rails_helper'

describe InstructorStudent, type: :model do
  describe 'validations' do
    it { should validate_presence_of :instructor_id }
    it { should validate_presence_of :student_id }
    it { should validate_presence_of :cohort }
  end

  describe 'relationships' do
    it { should belong_to :instructor }
    it { should belong_to :student }
  end
end
