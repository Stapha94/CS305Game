# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

facilitators = Facilitator.create!([{ email: 'test@gmail.com', first: 'Test', last: 'Testerson',  password_digest: Facilitator.digest("password") },
                                    { email: 'test@ymail.com', first: 'Dude', last: 'Duderson', password_digest: Facilitator.digest("123456")}])
admins = Admin.create!([{ email: 'admin@gmail.com', first: 'Atest', last: 'Atesterson', password_digest: Admin.digest("password") }])
questions = Question.create!([{ qid: 1, chapter: 1, answer: 'seeds', description: 'What part of a pumpkin is edible?' }])
