# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.destroy_all
Book.destroy_all

harper_lee = Author.create(name: "Harper Lee")
tkam = harper_lee.books.create(title: "To Kill a Mockingbird", number_of_pages: 296, publication_year: 1960)
