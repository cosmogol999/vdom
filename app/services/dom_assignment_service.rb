class DomAssignmentService < Service
  def initialize(dom_assignment)
    @dom_assignment =  dom_assignment
    @dom = dom_assignment.dom
  end

  class AlreadyStartedError < StandardError; end
  class StatusChangeError < StandardError; end

  def start
    return build_result(nil, AlreadyStartedError.new(I18n.t("errors.already_started_assignment"))) if @dom_assignment.started_at
    return build_result(nil, StatusChangeError.new(I18n.t("errors.status_change"))) if @dom.housework? || @dom.punished?

    change_status(@dom_assignment.assignment.kind)


    @dom_assignment.update!(started_at: Time.now.in_time_zone(@dom.user.time_zone))

    build_result(@dom_assignment, nil)
  end

  def stop
    @dom_assignment.update!(completed_at: Time.now.in_time_zone(@dom.user.time_zone))

    if @dom_assignment.completed_on_time?
      message = I18n.t("messages.task_completed.on_time.#{random_message}")
      # plus merit points
    else 
      if @dom_assignment.completed_too_fast?
        message = I18n.t("messages.task_completed.too_fast.#{random_message}")
        @dom_assignment.update!(started_at: nil, completed_at: nil)
        # minus merit points
      else @dom_assignment.completed_too_slow?
        message = I18n.t("messages.task_completed.too_slow.#{random_message}")
        # minus merit points
        # add punishment assignment
      end
    end

    @dom.serving!
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