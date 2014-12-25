class CreateCommunications < ActiveRecord::Migration
  def change
    create_table :communications do |t|
      t.integer :message_id
      t.integer :from_id
      t.integer :to_id
      t.timestamps null: false
    end
  end
end
