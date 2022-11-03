# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user_seed = User.create(
  name: 'Tom',
  photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
  bio: 'Teacher from Mexico.'
)

second_user_seed = User.create(
  name: 'Elvis',
  photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
  bio: 'Elvis is from Argentina and loves working with ruby on rails.'
)

first_post_seed = Post.create(
  author: first_user_seed,
  title: 'First post by first user',
  text: 'This is my first post'
)

second_post_seed = Post.create(
  author: second_user_seed,
  title: 'First post by second user and i am Elvis',
  text: 'This is my first post'
)

User.create(
  name: 'Alpha',
  photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
  bio: 'Teacher from Uganda.'
)
Post.create(
  author: first_user_seed,
  title: 'Second post by first user',
  text: 'This is my second post'
)

12.times do |i|
  Post.create(
    author: first_user_seed,
    title: 'Second post by first user',
    text: "This is my post #{i+1}"
  )
end

8.times do |i|
  Post.create(
    author: second_user_seed,
    title: 'Second post by second user Who is Elvis',
    text: "This is my  post #{i+1}"
  )
end

Comment.create(
  post: first_post_seed,
  author: first_user_seed,
  text: 'Hi Tom!'
)

10.times do |i|
  Comment.create(
    post: first_post_seed,
    author: first_user_seed,
    text: "Hi Tom! #{i + 1}"
  )
end

13.times do |i|
  Comment.create(
    post: second_post_seed,
    author: first_user_seed,
    text: "Hi Elvis my comment ! #{i + 1}"
  )
end
