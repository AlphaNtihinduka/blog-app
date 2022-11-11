# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(
  name: 'Tom',
  photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
  bio: 'Teacher from Mexico.'
)

User.create(
  name: 'Elvis',
  photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
  bio: 'Elvis is from Argentina and loves working with ruby on rails.'
)

User.create(
  name: 'NTIHINDUKA ALPHA',
  photo: nil,
  bio: nil,
  email: 'ntihindukaalpha@yahoo.com',
  role: 'admin'
)

Post.create(
  author: User.first,
  title: 'First post by first user',
  text: 'This is my first post'
)

Post.create(
  author: User.last,
  title: 'First post by second user and i am Elvis',
  text: 'This is my first post'
)

Post.create(
  author: User.first,
  title: 'third post by second user and i am Elvis',
  text: 'This is my third post'
)

Post.create(
  author: User.first,
  title: 'forth post by second user and i am Elvis',
  text: 'This is my third post'
)

Post.create(
  author: User.last,
  title: 'Second post by first user',
  text: 'This is my second post'
)

Comment.create(
  post: Post.first,
  author: User.first,
  text: 'Hi Tom!'
)

Comment.create(
  post: Post.first,
  author: User.first,
  text: 'Hi Elvis!'
)

# 12.times do |i|
#   Post.create(
#     author: User.first,
#     title: 'Second post by first user',
#     text: "This is my post #{i + 1}"
#   )
# end

# 8.times do |i|
#   Post.create(
#     author: User.last,
#     title: 'Second post by second user Who is Elvis',
#     text: "This is my  post #{i + 1}"
#   )
# end

# 10.times do |i|
#   Comment.create(
#     post: Post.first,
#     author: User.first,
#     text: "Hi Tom! #{i + 1}"
#   )
# end

# 13.times do |i|
#   Comment.create(
#     post: Post.last,
#     author: User.last,
#     text: "Hi Elvis my comment ! #{i + 1}"
#   )
# end
