# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test_author, player1, player2 = User.create!(
  [{ name: 'Bogdan', login: 'bogdan_14_1', password: 'bogdan_love_14_1', email: 'bogdan@mail.com' },
   { name: 'Sakamota', login: 'sakamoto', password: 'sakamoto_love_14_1', email: 'sakamoto@mail.com' },
   { name: 'Johan', login: 'johan', password: 'johan_love_14_1', email: 'johan@mail.com' }]
)

categories1, categories2 = Category.create!(
  [{ name: 'Japanese cars' },
   { name: 'German cars' }]
)

test1, test2, test3, test4 = Test.create!(
  [{ title: 'Nissan', level: 1, category_id: categories1.id, author_id: test_author.id },
   { title: 'Mitsubishi', level: 2, category_id: categories1.id, author_id: test_author.id },
   { title: 'Mercedes-Benz', level: 1, category_id: categories2.id, author_id: test_author.id },
   { title: 'Mercedes-Benz', level: 2, category_id: categories2.id, author_id: test_author.id }]
)

questions1,
questions2,
questions3,
questions4 =
  Question.create!([
                     { body: 'What year was Nissan founded?', test_id: test1.id },
                     { body: 'How many generations does Mitsubishi evolution have', test_id: test2.id },
                     { body: 'What year was Mercedes founded?', test_id: test3.id },
                     { body: 'Fastest mercedes car?', test_id: test4.id }
                   ])

Answer.create!(
  [{ body: 'December 26, 1933', correct: true, question_id: questions1.id },
   { body: 'December 26, 1941', question_id: questions1.id },
   { body: 'What is nissan?', question_id: questions1.id },
   { body: '10', correct: true, question_id: questions2.id },
   { body: '7', question_id: questions2.id },
   { body: 'I dont watch pokemon', question_id: questions2.id },
   { body: 'June 28, 1926', correct: true, question_id: questions3.id },
   { body: 'June 28, 1826', question_id: questions3.id },
   { body: 'Im a BMW fan', question_id: questions3.id },
   { body: 'Mercedes SLR Stirling Moss', correct: true, question_id: questions4.id },
   { body: 'Mercedes-AMG® C 63 S', question_id: questions4.id },
   { body: 'BMW M4', question_id: questions4.id }]
)

UserTest.create!([
                   { user_id: player1.id, test_id: test1.id },
                   { user_id: player2.id, test_id: test2.id, complete: true }
                 ])
