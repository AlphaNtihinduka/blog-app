# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user_seed = User.create(
  name: 'Tom',
  photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
  bio: 'Teacher from Mexico.'
)

second_user_seed = User.create(
  name: 'Elvis',
  photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
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
  photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
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
