require 'rails_helper'

describe Student, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :instructor_students }
    it { should have_many(:instructors).through(:instructor_students) }
  end
end