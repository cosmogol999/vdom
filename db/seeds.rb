# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

User.destroy_all
Dom.destroy_all
Assignment.destroy_all

# Users
user1 = User.create!(email: "test@test.com", password: "testtest", name: "Test Sissy #1")
user2 = User.create!(email: "test2@test.com", password: "testtest", name: "Test Sissy #2")

# Doms
dom1 = Dom.create!(user: user1, pronoun: "her", title: "Goddess", name: "Test")

# Assignments
a1 = Assignment.create!(
  max_completion_time: 60,
  min_completion_time: 30,
  description: "Sissy, You must implement a new feature. Make it humiliating.",
  title: "Implement a new feature",
  kind: "housework",
  level: "easy"
)

a2 = Assignment.create!(
  max_completion_time: nil,
  min_completion_time: 30,
  description: "To remind you what a slut you are, wear a small butt plug for 30 minutes",
  title: "Wear a buttplug for 30 minutes",
  kind: "punishment",
  level: "mid"
)

a3 = Assignment.create!(
  max_completion_time: 120,
  min_completion_time: 60,
  description: "Wash by hand all your lingerie my little slut.",
  title: "Wash lingerie",
  kind: "housework",
  level: "mid"
)

dom1.dom_assignments.create!(assignment: a1)
dom1.dom_assignments.create!(assignment: a2)
dom1.dom_assignments.create!(assignment: a3)