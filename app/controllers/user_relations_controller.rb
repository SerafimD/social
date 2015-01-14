class UserRelationsController < ApplicationController
before_action :find_current_user_relation, only: [:show, :destroy] 
before_filter :authenticate_user!

  def index
    
  end

  def show
    
  end


  def new
     @user_relation = UserRelation.new
  end

  def create
    @user_relation = CommunityMembership.new(user_relation_params)
    @user_relation.user_owner_id = current_user.id
    if @user_relation.save
      rednder :show
    else
      render :new
    end
  end

  def destroy
    @user_relation.destroy
    redirect_to user_root_path
  end

  private


  def user_relation_params
    params.require(:community_membership).permit(:user_rel_id)
  end


  def find_current_user_relation
     @user_relation = UserRelation.where(id: params[:id]).take 
  end

end
