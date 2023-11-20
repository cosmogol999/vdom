# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

User.destroy_all
Dom.destroy_all
Assignment.destroy_all

# Users
user1 = User.create!(email: "test@test.com", password: "testtest", name: "Test Sissy #1", time_zone: "Paris")
user2 = User.create!(email: "test2@test.com", password: "testtest", name: "Test Sissy #2", time_zone: "London")

# Doms
dom1 = Dom.create!(user: user1, pronoun: "her", title: "Goddess", name: "Test")

# Assignments
## Housework
Assignment.create!(
  max_completion_time: 60,
  min_completion_time: 30,
  description: "Sissy, You must implement a new feature. Make it humiliating.",
  title: "Implement a new feature",
  kind: "housework",
  level: "easy"
)

Assignment.create!(
  max_completion_time: 120,
  min_completion_time: 60,
  description: "Wash by hand all your lingerie my little slut.",
  title: "Wash lingerie",
  kind: "housework",
  level: "mid"
)

## Punishment
Assignment.create!(
  max_completion_time: nil,
  min_completion_time: 5,
  description: "Put nipple clamps for 5 minutes. Feel free to pull on it, sissy.",
  title: "Nipple clamps for 5 minutes",
  kind: "punishment",
  level: "very_easy"
)

Assignment.create!(
  max_completion_time: nil,
  min_completion_time: 5,
  description: "Face down, ass up like a good slut. Now shake that butt for 5 minutes.",
  title: "Assume the position",
  kind: "punishment",
  level: "easy",
)

Assignment.create!(
  max_completion_time: nil,
  min_completion_time: 30,
  description: "To remind you what a slut you are, wear a small butt plug for 30 minutes",
  title: "Wear a buttplug for 30 minutes",
  kind: "punishment",
  level: "mid",
  individual: false,
)

Assignment.create!(
  max_completion_time: nil,
  min_completion_time: 2880,
  description: "You will spend two full days in chastity.",
  title: "Chastity time",
  kind: "punishment",
  level: "hard",
  individual: false,
)

## Training
Assignment.create!(
  max_completion_time: 20,
  min_completion_time: 10,
  description: "Time for a little hypno to conditionate you, sissy. Put a buttplug and visit: https://tinyurl.com/bdhxsp7c. You can touch yourself slut but no edging or cumming. Report failure immediately!",
  title: "Hypno time",
  kind: "training",
  level: "easy"
)


Assignment.all.each{ |a| dom1.dom_assignments.create(assignment: a) }