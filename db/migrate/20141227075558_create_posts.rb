class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.datetime :publish_date
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
