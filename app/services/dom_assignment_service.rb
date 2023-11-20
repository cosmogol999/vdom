class DomAssignmentService < Service
  def initialize(dom_assignment)
    @dom_assignment =  dom_assignment
    @dom = dom_assignment.dom
    @assignment = dom_assignment.assignment
  end

  class AlreadyStartedError < StandardError; end
  class StatusChangeError < StandardError; end

  def start
    return build_result(nil, AlreadyStartedError.new(I18n.t("errors.already_started_assignment"))) if @dom_assignment.started_at
    return build_result(nil, StatusChangeError.new(I18n.t("errors.status_change"))) if @dom.status != "serving" && @assignment.individual?

    change_status(@dom_assignment.assignment.kind)


    @dom_assignment.update!(started_at: Time.now.in_time_zone(@dom.user.time_zone))

    build_result(@dom_assignment, nil)
  end

  def stop
    @dom_assignment.update!(completed_at: Time.now.in_time_zone(@dom.user.time_zone))

    if @dom_assignment.completed_on_time?
      # Set Message
      message = I18n.t("messages.task_completed.on_time.#{random_message}")
      # Update merit
      MeritService.new(@dom.user, @assignment.level).add
    else 
      if @dom_assignment.completed_too_fast?
        # Set Message
        message = I18n.t("messages.task_completed.too_fast.#{random_message}")
        # Reset assignment
        @dom_assignment.update!(started_at: nil, completed_at: nil)
        # Update merit
        MeritService.new(@dom.user, @assignment.level).remove
      else @dom_assignment.completed_too_slow?
        # Set Message
        message = I18n.t("messages.task_completed.too_slow.#{random_message}")
        # Add new punishment
        res = AssignmentPickerService.new(:punishment, :easy).pick
        @dom.dom_assignments.create(assignment: res.data)
      end
    end

    # TODO: handle status with individual and multiple assignments
    @dom.serving! if @assignment.individual?
    build_result(@dom_assignment, nil, message)
  end

  private

  def change_status(status)
    @dom.housework! if status == "housework"
  end

  def random_message
    ["a", "b", "c"].shuffle.first
  end
end