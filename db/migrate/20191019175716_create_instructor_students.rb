class CreateInstructorStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :instructor_students do |t|
      t.references :instructor, foreign_key: true
      t.references :student, foreign_key: true
      t.integer :cohort
    end
  end
end
