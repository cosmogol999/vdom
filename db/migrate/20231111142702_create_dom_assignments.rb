class CreateDomAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :dom_assignments do |t|
      t.datetime :started_at
      t.datetime :completed_at
      t.integer :dom_id
      t.integer :assignment_id
      
      t.timestamps
    end
  end
end
