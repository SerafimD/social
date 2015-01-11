class UsersController < ApplicationController
  #before_action :authenticate_user!

  def profile
  end

  def show_profile
    user = User.where(id: current_user.id).take
    if user == nil 
      resirect_to root_path
      return
    end

    if user.person?
      person = Person.where(user_id: user.id).take
      if person == nil
      redirect_to  url_for(:controller => :people, :action => :new)
      else
      redirect_to  url_for(:controller => :people, :action => :show, :id => person.id)
      end

    elsif user.community?
      community = Community.where(user_id: user.id).take
      if community == nil
        redirect_to  url_for(:controller => :communities, :action => :new)
      else
        redirect_to url_for(:controller => :communities, action => :show, :id =>community.id)
      end
    else
      redirect_to  root_path
    end 

   
  end

end
