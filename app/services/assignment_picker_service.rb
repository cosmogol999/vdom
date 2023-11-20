class AssignmentPickerService < Service
  def initialize(kind, level)
    @kind = kind
    @level = level
  end

  def pick
    count = assignments.count
    random = rand(count)

    build_result(assignments.offset(random).first, nil)
  end

  private

  def assignments
    Assignment.send(@kind).send(@level)
  end
end