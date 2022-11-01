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
    bio: 'Teacher from Mexico.')

second_user_seed = User.create(
    name: 'Alpha',
    photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
    bio: 'Teacher from Uganda.')

first_post_seed = Post.create(
    author: first_user_seed, 
    title: 'First post by first user',
    text: 'This is my first post')

second_post_seed = Post.create(
    author: first_user_seed, 
    title: 'Second post by first user',
    text: 'This is my second post')

comment_seed = Comment.create(
        post: first_post_seed,
        author: first_user_seed,
        text: 'Hi Tom!' )

7.times do |i|
    Comment.create(
        post: first_post_seed,
        author: first_user_seed,
        text: "Hi Tom! #{i+1}" )
end


