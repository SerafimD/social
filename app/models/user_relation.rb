class UserRelation < ActiveRecord::Base
  belongs_to :user_owner, :class_name =>"User", :inverse_of => :user_owner_relations
  validates  :user_owner, :presence => true

  belongs_to :user_rel, :class_name => "User", :inverse_of => :user_rel_relations
end
