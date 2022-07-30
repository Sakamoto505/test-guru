# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test_author, player1, player2 = User.create!(
  [{ first_name: 'Bogdan', last_name: 'Qqq', password: 'bogdan_love_14_1', email: 'bogdan@mail.com' },
   { first_name: 'Sakamota',last_name: 'Www', password: 'sakamoto_love_14_1', email: 'sakamoto@mail.com' },
   { first_name: 'Johan',last_name: 'Eee', password: 'johan_love_14_1', email: 'johan@mail.com' }]
)

categories1, categories2 = Category.create!(
  [{ name: 'Japanese cars' },
   { name: 'German cars' }]
)

test1, test2, test3, test4 = Test.create!(
  [{ title: 'Nissan', level: 1, category: categories1, author: test_author },
   { title: 'Mitsubishi', level: 2, category: categories1, author: test_author },
   { title: 'Mercedes-Benz', level: 1, category: categories2, author: test_author },
   { title: 'Mercedes-Benz', level: 2, category: categories2, author: test_author }]
)

questions1,
questions2,
questions3,
questions4 =
  Question.create!([
                     { body: 'What year was Nissan founded?', test: test1 },
                     { body: 'How many generations does Mitsubishi evolution have', test: test2 },
                     { body: 'What year was Mercedes founded?', test: test3 },
                     { body: 'Fastest mercedes car?', test: test4 }
                   ])

Answer.create!(
  [{ body: 'December 26, 1933', correct: true, question: questions1 },
   { body: 'December 26, 1941', question: questions1 },
   { body: 'What is nissan?', question: questions1 },
   { body: '10', correct: true, question: questions2 },
   { body: '7', question: questions2 },
   { body: 'I dont watch pokemon', question: questions2 },
   { body: 'June 28, 1926', correct: true, question: questions3 },
   { body: 'June 28, 1826', question: questions3 },
   { body: 'Im a BMW fan', question: questions3 },
   { body: 'Mercedes SLR Stirling Moss', correct: true, question: questions4 },
   { body: 'Mercedes-AMG® C 63 S', question: questions4 },
   { body: 'BMW M4', question: questions4 }]
)

UserTest.create!([
                   { user: player1, test: test1 },
                   { user: player2, test: test2, complete: true }
                 ])
