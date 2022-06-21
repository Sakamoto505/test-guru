# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: 'Bogdan', login: 'bogdan_14_1', password: 'bogdan_love_14_1', email: 'bogdan@mail.com')
player_japan = User.create(name: 'Sakamota')
player_german = User.create(name: 'Johan')

japanese_cars = Category.create(name: 'Japanese cars')
german_cars = Category.create(name: 'German cars')

test_japan1 = Test.create(title: 'Nissan', level: 1, category_id: japanese_cars.id, author: user.id)
test_japan2 = Test.create(title: 'Mitsubishi', level: 2, category_id: japanese_cars.id, author: user.id)
test_german1 = Test.create(title: 'Mercedes-Benz', level: 1, category_id: german_cars.id, author: user.id)
test_german2 = Test.create(title: 'Mercedes-Benz', level: 2, category_id: german_cars.id, author: user.id)

question_about_japanese_cars1 = Question.create(body: 'What year was Nissan founded?', test_id: test_japan1.id)
question_about_japanese_cars2 = Question.create(body: 'How many generations does Mitsubishi evolution have',
                                                test_id: test_japan2.id)

question_about_germane_cars1 = Question.create(body: 'What year was Mercedes founded?', test_id: test_german1.id)
question_about_germane_cars2 = Question.create(body: 'Fastest mercedes car?', test_id: test_german2.id)

Answer.create(body: 'December 26, 1933', correct: true, question_id: question_about_japanese_cars1.id)
Answer.create(body: 'December 26, 1941', question_id: question_about_japanese_cars1.id)
Answer.create(body: 'What is nissan?', question_id: question_about_japanese_cars1.id)

Answer.create(body: '10', correct: true, question_id: question_about_japanese_cars2.id)
Answer.create(body: '7', question_id: question_about_japanese_cars2.id)
Answer.create(body: 'I dont watch pokemon', question_id: question_about_japanese_cars2.id)

Answer.create(body: 'June 28, 1926', correct: true, question_id: question_about_germane_cars1.id)
Answer.create(body: 'June 28, 1826', question_id: question_about_germane_cars1.id)
Answer.create(body: 'Im a BMW fan', question_id: question_about_germane_cars1.id)

Answer.create(body: 'Mercedes SLR Stirling Moss', correct: true, question_id: question_about_germane_cars2.id)
Answer.create(body: 'Mercedes-AMG® C 63 S', question_id: question_about_germane_cars2.id)
Answer.create(body: 'BMW M4', question_id: question_about_germane_cars2.id)

UserTest.create(user_id: player_japan, test_id: test_japan1.id)
UserTest.create(user_id: player_german, test_id: test_german1.id, complete: true)
