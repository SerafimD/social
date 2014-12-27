class CreateCommunityMemberships < ActiveRecord::Migration
  def change
    create_table :community_memberships do |t|      
      t.belongs_to :community, index:true
      t.belongs_to :user, index:true

      t.timestamps null: false
    end
  end
end
