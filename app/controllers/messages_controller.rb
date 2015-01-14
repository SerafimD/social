class MessagesController < ApplicationController

  before_action :authenticate_user!

def index
  @message_recieve = []
  @message_send = []
  current_user.recieved_messages.each {|t| @message_recieve << [User.find(t.user_id_to).name, t.message_text] }
  current_user.send_messages.each {|t| @message_send << [User.find(t.user_id_from).name, t.message_text] }


  @users = User.all

    if request.method == "POST"
      mes = Message.new
      mes.message_text = params[:message]
      current_user.send_messages << mes
      User.find((params[:recive_id])).recieved_messages << mes
      @test = params[:recive_id]
      mes.save
      redirect_to :action => :index
    end
end



end
