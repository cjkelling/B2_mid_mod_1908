ActiveRecord::Schema.define(version: 20_191_019_175_716) do
  enable_extension 'plpgsql'

  create_table 'instructor_students', force: :cascade do |t|
    t.bigint 'instructor_id'
    t.bigint 'student_id'
    t.integer 'cohort'
    t.index ['instructor_id'], name: 'index_instructor_students_on_instructor_id'
    t.index ['student_id'], name: 'index_instructor_students_on_student_id'
  end

  create_table 'instructors', force: :cascade do |t|
    t.string 'name'
  end

  create_table 'students', force: :cascade do |t|
    t.string 'name'
    t.integer 'age'
  end

  add_foreign_key 'instructor_students', 'instructors'
  add_foreign_key 'instructor_students', 'students'
end
