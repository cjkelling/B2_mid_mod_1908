class Student < ApplicationRecord
  validates_presence_of :name

  has_many :instructor_students
  has_many :instructors, through: :instructor_students
end
