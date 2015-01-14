class CommunityMembershipsController < ApplicationController
before_action :find_current_community_membership, only: [:show, :destroy] 
before_filter :authenticate_user!

  def index
    
  end

  def show
    
  end


  def new
    @community_membership = CommunityMembership.new
  end

  def create
    @community_membership = CommunityMembership.new(community_params)
    @community_membership.community_id = current_user.id
    if @community_membership.save
      render :show
    else
      render :new
    end
  end

  def destroy
    community_id = @community_membership.community_id
    @community_membership.destroy
    redirect_to url_for(:controller => :communities, :action => :show, :id => community_id)
  end

  private


  def community_membership_params
    params.require(:community_membership).permit(:user_id)
  end


  def find_current_community_membership
     @community_membership = CommunityMembership.where(id: params[:id]).take 
  end
end
