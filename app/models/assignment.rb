class Assignment < ApplicationRecord
  has_many :dom_assignments, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :kind, presence: true
  validates :level, presence: true
  validates :min_completion_time, presence: true

  enum :kind, [:housework, :punishment, :training]
  enum :level, [:very_easy, :easy, :mid, :hard, :very_hard]
end