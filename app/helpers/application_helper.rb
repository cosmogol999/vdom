module ApplicationHelper
  HUMILIATING_NAMES = [
    "Sissy",
    "Slut",
    "Cumdump",
    "Whore"
].freeze

  def random_humiliating_name
    HUMILIATING_NAMES.shuffle.first
  end
end
