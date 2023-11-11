class Dom < ApplicationRecord
  belongs_to :user
  has_many :dom_assignments, dependent: :destroy

  validates :name, presence: true
  validates :title, presence: true
  validates :pronoun, presence: true

  enum :pronoun, [:him, :her, :them]
  enum :status, [:inactive, :serving, :housework, :punished], default: :serving

  def full_name
    "#{title} #{name}"
  end
end