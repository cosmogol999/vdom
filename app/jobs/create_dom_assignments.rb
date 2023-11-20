class CreateDomAssignments < ApplicationJob

  def perform(dom_id)
    DomAssignment.create!(dom_id: dom_id, assignment: Assignment.last)
  end
end