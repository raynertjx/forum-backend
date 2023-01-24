# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ForumCategory.create(name: "University Life", latest_thread: "test", thread_count: 0, url:"university-life", subtitle: "General discussion about life in NUS!")
ForumCategory.create(name: "Module Reviews", latest_thread: "test", thread_count: 0, url:"module-reviews", subtitle: "Discuss academic modules!")
ForumCategory.create(name: "Interest Groups", latest_thread: "test", thread_count: 0, url:"interest-groups", subtitle: "Explore your interests with others!")
ForumCategory.create(name: "Food Reviews", latest_thread: "test", thread_count: 0, url:"food-reviews", subtitle: "Find out what to have for lunch!")
ForumCategory.create(name: "Homework Help", latest_thread: "test", thread_count: 0, url:"homework-help", subtitle: "Your SOS when your assignment is due!")

