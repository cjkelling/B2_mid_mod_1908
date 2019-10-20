class Instructor < ApplicationRecord
  validates_presence_of :name

  has_many :instructor_students
  has_many :students, through: :instructor_students

  def all_students
    students.map(&:name)
  end

  def average_age_of_students
    students.average(:age)
  end
end