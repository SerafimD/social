class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :subject
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
