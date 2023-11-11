class DomAssignment < ApplicationRecord
  belongs_to :dom
  belongs_to :assignment

  scope :uncompleted, -> { where(completed_at: nil) }

  def completed_on_time?
    return false if completed_at.nil?
    puts "assignment.min_completion_time: #{assignment.min_completion_time}"
    puts "assignment.max_completion_time: #{assignment.max_completion_time}"

    completed_in.between?(assignment.min_completion_time, (assignment.max_completion_time || 999999))
  end

  def completed_too_fast?
    completed_in < assignment.min_completion_time
  end

  def completed_too_slow?
    completed_in > assignment.max_completion_time.to_i
  end

  def completed_in
    ((completed_at - started_at) / 1.minutes)
  end
end