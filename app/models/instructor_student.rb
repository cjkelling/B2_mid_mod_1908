class InstructorStudent < ApplicationRecord
  belongs_to :instructor
  belongs_to :student

  validates_presence_of :instructor_id,
                        :student_id,
                        :cohort
end
