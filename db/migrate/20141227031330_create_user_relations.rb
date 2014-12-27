class CreateUserRelations < ActiveRecord::Migration
  def change
    create_table :user_relations do |t|
      t.integer :owner_id, index: true
      t.integer :user_rel_id, index: true 
      t.timestamps null: false
    end
  end
end
