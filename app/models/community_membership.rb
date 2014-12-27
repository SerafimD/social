class CommunityMembership < ActiveRecord::Base
  belongs_to :user
  belons_to :community
end
