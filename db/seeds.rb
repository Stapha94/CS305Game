# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

facilitators = Facilitator.create([{ usrname: 'facilitator', password_digest: 'password', report: 'Report', in_charge: 'true' }])
admins = Admin.create([{ usrname: 'admin', password_digest: '123456', authorized: 'true' }])
