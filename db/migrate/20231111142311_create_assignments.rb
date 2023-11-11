class CreateAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :assignments do |t|
      t.integer :min_completion_time
      t.integer :max_completion_time
      t.string :description
      t.string :title
      t.integer :kind
      t.integer :level

      t.timestamps
    end
  end
end
