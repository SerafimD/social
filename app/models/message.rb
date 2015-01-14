class Message < ActiveRecord::Base
belongs_to :message_to_user, class_name: "User", foreign_key: "message_to" 
belongs_to :message_from_user, class_name: "User", foreign_key: "message_from" 
end
