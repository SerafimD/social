class Community < ActiveRecord::Base
  has_one :user
  has_many :users, through: :community_memberships, dependent: :destroy
end
