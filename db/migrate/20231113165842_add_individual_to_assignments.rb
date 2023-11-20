class AddIndividualToAssignments < ActiveRecord::Migration[7.1]
  def change
    add_column :assignments, :individual, :boolean, default: true
  end
end
