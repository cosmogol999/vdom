class AddMeritToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :merit, :integer, default: 50
  end
end
