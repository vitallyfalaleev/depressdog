# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' },
# { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

20.times do
  User.create(name: Faker::Games::Witcher.character,
              email: Faker::Internet.unique.email,
              image_url: Faker::Avatar.image,
              password: '111111a',
              email_confirmed: true)
end
10.times do
  Post.create(title: Faker::ProgrammingLanguage.name,
              body: Faker::Lorem.paragraph(sentence_count: 25, supplemental: false, random_sentences_to_add: 4),
              user_id: User.all.order('RANDOM()').first.id)
end
5.times do
  post = Post.all.order('RANDOM()').first
  Image.create(remote_image_url: Faker::LoremPixel.image,
               post_id: post.id,
               user_id: post.user_id)
end
20.times do
  Comment.create(body: Faker::TvShows::DrWho.quote,
                 remote_image_url: Faker::LoremPixel.image,
                 commentable_id: Post.all.order('RANDOM()').first.id,
                 commentable_type: 'Post',
                 user_id: User.all.order('RANDOM()').first.id)
end
30.times do
  Comment.create(body: Faker::Games::Witcher.quote,
                 commentable_id: Comment.all.order('RANDOM()').first.id,
                 commentable_type: 'Comment',
                 user_id: User.all.order('RANDOM()').first.id)
end
10.times do
  Like.create(likable_id: Post.all.order('RANDOM()').first.id,
              likable_type: 'Post',
              user_id: User.all.order('RANDOM()').first.id)
end
30.times do
  Like.create(likable_id: Comment.all.order('RANDOM()').first.id,
              likable_type: 'Comment',
              user_id: User.all.order('RANDOM()').first.id)
end
