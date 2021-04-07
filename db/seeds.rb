user1 = User.create('user1@mailinator.cm', 'password')
user2 = User.create('user2@mailinator.cm', 'password')

5.times { user1.blogs.create!(title: Faker::Lorem.word, body: Faker::Lorem.sentence) }
5.times { user2.blogs.create!(title: Faker::Lorem.word, body: Faker::Lorem.sentence) }

5.times { user1.blogs.first.comments.create!(body: Faker::Lorem.sentence, user_id: '2') }
5.times { user1.blogs.last.comments.create!(body: Faker::Lorem.sentence, user_id: '2') }
5.times { user2.blogs.first.comments.create!(body: Faker::Lorem.sentence, user_id: '1') }
5.times { user2.blogs.last.comments.create!(body: Faker::Lorem.sentence, user_id: '1') }
