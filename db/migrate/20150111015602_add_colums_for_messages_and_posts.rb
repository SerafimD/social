class AddColumsForMessagesAndPosts < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :post_id
      t.integer :message_to
      t.integer :message_from
    end

    change_table :messages do |t|
      t.integer :user_id_to
      t.integer :user_id_from
      t.text :message_text
    end
  end
end
