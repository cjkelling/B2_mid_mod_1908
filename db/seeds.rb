Instructor.destroy_all
Student.destroy_all

mike = Instructor.create(name: 'Mike')
christopher = Student.create(name: "Christopher", age: 31)
InstructorStudent.create(instructor_id: "#{mike.id}", student_id: "#{christopher.id}", cohort: 1908)
