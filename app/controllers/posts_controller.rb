class PostsController < ApplicationController
before_action :find_current_post, only: [:show, :edit, :update, :destroy] 
before_filter :authenticate_user!

 def index
 
  end

  def show
    
  end

  def edit
    render :new unless @post
  end

  def update
    if @post.update(post_params)
      render :show
    else
      render :edit
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      render :show
    else
      render :new
    end    
  end

  def destroy
    @post.destroy
    redirect_to user_root_path
  end

  private


  def post_params
    params.require(:post).permit(:content, :publish_date)
  end

  def find_current_post
     @post = Post.where(id: params[:id]).take
  end

end
