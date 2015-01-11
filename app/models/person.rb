class Person < ActiveRecord::Base
  belongs_to :user, :foreign_key => "id"


  def user
    User.where(id: self.user_id).take
  end
end
