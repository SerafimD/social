class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable
#has_many :communications
#has_many :posts
  belongs_to :person, dependent: :destroy
  belongs_to :community, dependent: :destroy
  has_many :community, through: :community_memberships, dependent: :destroy
  has_many :user_owner_relations, :class_name =>'UserRelation', :foreign_key =>"owner_id", :inverse_of => :user_owner, dependent: :destroy
  has_many :user_rel_relations, :class_name => 'UserRelation', :foreign_key =>"user_rel_id", :inverse_of => :user_rel, dependent: :destroy
  has_many :posts, dependent: :destroy

  def kind_name
    if self.kind == 1
      'Person'
    elsif self.kind == 10
      'Community'
    else
      'Unknown kind'
    end
  end

  def person?
    self.kind == 1
  end

  def community?
    self.kind == 10
  end

end
