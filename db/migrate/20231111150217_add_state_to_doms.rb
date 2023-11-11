class AddStateToDoms < ActiveRecord::Migration[7.1]
  def change
    add_column :doms, :status, :integer
  end
end
