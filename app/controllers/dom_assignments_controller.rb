class DomAssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_dom!
  before_action :load_dom_assignment, except: [:index]

  def index
    @dom_assignments = @current_dom.dom_assignments.uncompleted.order("started_at ASC")
  end

  def start
    res = DomAssignmentService.new(@dom_assignment).start
    if res.error.present?
      flash[:alert] = res.error.message
      redirect_to dom_assignments_path
    else
      redirect_to doms_path
    end
  end

  def stop
    res = DomAssignmentService.new(@dom_assignment).stop
    if res.error.present?
      flash[:alert] = res.error.message
      redirect_to dom_assignments_path
    else
      redirect_to doms_path, notice: res.message
    end
  end

  private

  def authorize_dom!
    authorize! :read, @current_dom
  end

  def load_dom_assignment
    @dom_assignment = DomAssignment.find(params[:id])

    authorize! :read, @current_dom
  end
end