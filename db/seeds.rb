10.times { Blog.create!(title: Faker::Lorem.word, body: Faker::Lorem.sentence) }
