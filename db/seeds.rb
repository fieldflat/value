# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#
# ここを修正する。
#
# user1 = User.create(name: "平田智紀",
#                     email: "hirata.tomonori@j.mbox.nagoya-u.ac.jp",
#                     faculty: "情報学研究科",
#                     subject: "情報システム学専攻",
#                     grade: "修士1年",
#                     )

user = User.second
10.times do
  user.microposts.create!(title: "Test", content: "TestTestTestTestTestTest", price: "1000円")
end