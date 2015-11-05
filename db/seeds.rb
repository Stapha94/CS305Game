# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

facilitators = Facilitator.create!([{ email: 'test@gmail.com', first: 'Test', last: 'Testerson',  password_digest: Facilitator.digest("password"), squestion: 'What is the color of the sun?', sanswer: 'yellow' }])
admins = Admin.create!([{ email: 'admin@gmail.com', first: 'Atest', last: 'Atesterson', password_digest: Admin.digest("password"), squestion: 'What is the color of the sun?', sanswer: 'yellow' }])