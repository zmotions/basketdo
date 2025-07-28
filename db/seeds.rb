# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Initial dummy data
Category.destroy_all
Task.destroy_all

category1 = Category.create({ name: "Art"})
category2 = Category.create({ name: "Exercise"})

10.times do |index|
  Task.create({
                name: "Task #{index}",
                description: "This is a task",
                duration: 20 * index,
                due_on: (10 * index).days.from_now,
                category: category1
              })
end

10.times do |index|
  Task.create({
                name: "TODO #{index}",
                description: "This is a todo",
                duration: 20 * index,
                due_on: (10 * index).days.from_now,
                category: category2
              })
end