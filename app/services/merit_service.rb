class MeritService < Service
  LEVEL_TO_MERIT = {
    very_easy: 5,
    easy: 10,
    mid: 20,
    hard: 30,
    very_hard: 50
  }.freeze

  def initialize(user, level)
    @user = user
    @level = level
  end

  def add
    new_merit_score = [@user.merit += LEVEL_TO_MERIT[@level.to_sym], 0].max
    
    build_result(@user.update!(merit: new_merit_score), nil)
  end

  def remove
    new_merit_score = [@user.merit -= LEVEL_TO_MERIT[@level.to_sym], 0].max
    
    build_result(@user.update!(merit: new_merit_score), nil)
  end
end