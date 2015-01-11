class Community < ActiveRecord::Base
  belongs_to :user, :foreign_key => "user_id"
  has_many :users, through: :community_memberships#, dependent: :destroy
  has_many :community_memberships, dependent: :destroy

 def user
    User.where(id: self.user_id).take
  end
end
