class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :communication_id
      t.timestamps null: false
    end
  end
end
