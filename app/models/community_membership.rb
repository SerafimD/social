class CommunityMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :community

  def user
    User.where(id: self.user_id).take
  end

  def community
    Community.where(id: self.community_id).take
  end
end
