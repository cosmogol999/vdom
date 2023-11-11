class CreateDom < ActiveRecord::Migration[7.1]
  def change
    create_table :doms do |t|
      t.integer :pronoun
      t.string  :title
      t.string  :name
      t.integer :user_id

      t.timestamps
    end
    
    add_index :doms, :user_id, unique: true
  end
end
