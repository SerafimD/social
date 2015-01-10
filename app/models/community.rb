class Community < ActiveRecord::Base
  has_one :user, :foreign_key => "id"
  has_many :users, through: :community_memberships#, dependent: :destroy
  has_many :community_memberships, dependent: :destroy
end
