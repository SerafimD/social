class CommunitiesController < ApplicationController

def index
    @communities = Community.all
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    @community.user_id = current_user.id
    if @community.save
      redirect_to url_for(:controller => :communities, :action => :show, :id => @community.id)
    else
      render :new
    end
  end


  private


  def community_params
    params.require(:community).permit(:subject)
  end

end
