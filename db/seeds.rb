# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new(username: 'user', role: 'user')
user.password = '123'
user.save!

admin = User.new(username: 'admin', role: 'admin')
admin.password = '123'
admin.save!

user_post = user.posts.build(
  title: 'Stop Using These 16 Terms to Describe Yourself',
  content: "Do you describe yourself differently -- on your website, promotional materials, or especially on social media -- than you do in person? Do you use cheesy clichés and overblown superlatives and breathless adjectives? Do you write things about yourself you would never have the nerve to actually say?"
)
user_post.creator = user
user_post.save!

admin_post = admin.posts.build(
  title: "12 Reasons Why I Won’t Add You To My LinkedIn Connections",
  content: 'Please allow me to disagree with what your subconscious might be telling you after reading the title of my article. I am neither arrogant nor egotistical.'
)
admin_post.save!

admin_comment = admin.comments.build(
  content: "Content is this and that and don't forget to say it's great!"
)
admin_comment.post = user_post
admin_comment.save!

user_comment = user.comments.build(
  content: "Europe's fastest growing online auction house, featuring a wide range of special objects. Have a look at our auctions and place your bids!"
)
user_comment.post = admin_post
user_comment.save!

user_comment.like!
