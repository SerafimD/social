class CommunityMembership < ActiveRecord::Base
  belongs_to :user, :foreign_key => "user_id"
  belongs_to :community, :foreign_key => "community_id"

  def user
    User.where(id: self.user_id).take
  end

  def community
    Community.where(id: self.community_id).take
  end
end
