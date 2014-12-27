class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
#has_many :communications
#has_many :posts
  belongs_to :person
  belongs_to :community
  has_many :community, through: :community_memberships
  has_many :user_owner_relations, :class_name =>'UserRelation', :foreign_key =>"owner_id", :inverse_of => :user_owner
  has_many :user_rel_relations, :class_name => 'UserRelation', :foreign_key =>"user_rel_id", :inverse_of => :user_rel
end
