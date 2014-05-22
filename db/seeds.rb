# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

DEFAULT_INSECURE_PASSWORD = 'mikethefrog1'

User.create({
	first_name: "Mike",
	last_name: "TheFrog",
	profile_name: "mikethefrog",
	email: "mike@treehouse.com",
	password: DEFAULT_INSECURE_PASSWORD,
	password_confirmation: DEFAULT_INSECURE_PASSWORD
})

User.create({
	first_name: "Jason",
	last_name: "Seifer",
	profile_name: "jason",
	email: "jason@treehouse.com",
	password: DEFAULT_INSECURE_PASSWORD,
	password_confirmation: DEFAULT_INSECURE_PASSWORD
})

User.create({
	first_name: "Jim",
	last_name: "Hoskins",
	profile_name: "Jim",
	email: "jim@treehouse.com",
	password: DEFAULT_INSECURE_PASSWORD,
	password_confirmation: DEFAULT_INSECURE_PASSWORD
})

User.create({
	first_name: "Ryan",
	last_name: "Carson",
	profile_name: "ryan",
	email: "ryan@treehouse.com",
	password: DEFAULT_INSECURE_PASSWORD,
	password_confirmation: DEFAULT_INSECURE_PASSWORD
})

jason = User.find_by_email('jason@teamtreehouse.com')
mike = User.find_by_email('mike@teamtreehouse.com')
jim = User.find_by_email('jim@teamtreehouse.com')
ryan = User.find_by_email('ryan@teamtreehouse.com')

seed_user = jason

seed_user.statuses.create(content: "hello world")
jim.statuses.create(content: "yo im jim")
mike.statuses.create(content: "yo im mike")
ryan.statuses.create(content: "yo im ryan")

UserFriendship.request(seed_user, jim).accept!
UserFriendship.request(seed_user, nick).block!
UserFriendship.request(seed_user, mike)







