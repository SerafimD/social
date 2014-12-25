class Communication < ActiveRecord::Base
has_one :user
has_many :messages
end
