class CommunityMembershipsController < ApplicationController
before_action :find_current_community_membership, only: [:show, :destroy] 

  def index
    
  end

  def show
    
  end


  def new
    authenticate_user!
    @community_membership = CommunityMembership.new
  end

  def create
    @community_membership = CommunityMembership.new(community_params)
    @community_membership.community_id = current_user.id
    if @community_membership.save
      redirect_to url_for(:controller => :community_memberships, :action => :show, :id => @community_membership.id)
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
     authenticate_user!

     @community_membership = CommunityMembership.where(id: params[:id]).take 
  end
end
