# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(name: 'long_long_float', title: '生徒', 
  email: 'sample@example.com', 
  password: 'testtest', password_confirmation: 'testtest')
group = Group.new(name: '3I', quiz: 'クラスメートは何人?', answer: '50人', owner: user.id)
group.tag_list = 'SNCT, 電子情報工学科, 3年'
group.save

task = group.tasks.new(user_id: user.id, title: '教科書 問10', 
  content: '数学の教科書P100', deadline: DateTime.new(2013, 4, 20, 0, 0, 0))
task.tag_list = '数学, 宿題'
task.save