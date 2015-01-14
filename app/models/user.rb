class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable
  has_one :person, dependent: :destroy
  has_one :community, dependent: :destroy
  has_many :community_memberships, dependent: :destroy
  has_many :user_owner_relations, :class_name =>'UserRelation', :foreign_key =>"user_owner_id", :inverse_of => :user_owner, dependent: :destroy
  has_many :user_rel_relations, :class_name => 'UserRelation', :foreign_key =>"user_rel_id", :inverse_of => :user_rel, dependent: :destroy
  has_many :posts, dependent: :destroy

  def kind_name
    if self.kind == 1
      'Person'
    elsif self.kind == 2
      'Community'
    else
      'Unknown kind'
    end
  end

  def person?
    self.kind == 1
  end

  def community?
    self.kind == 2
  end

#  def person_id
#    person = Person.where(user_id: self.id).take
#    if person == nil
#      nil
#    else
#      person.id
#    end
# end

end
