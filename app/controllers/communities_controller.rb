class CommunitiesController < ApplicationController
before_action :find_current_community, only: [:show, :edit, :update] 
before_filter :authenticate_user!

  def index
    @communities = Community.all
  end

  def show
    
  end

  def edit
    render :new  unless @community
  end


  def update
    if @community.update(community_params)
      render :show 
    else
      render :edit
    end
  end


  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    @community.user_id = current_user.id
    if @community.save
      render :show 
    else
      render :new
    end
  end


  private


  def community_params
    params.require(:community).permit(:subject)
  end


  def find_current_community
     @community = Community.where(id: params[:id]).take 
  end
end
