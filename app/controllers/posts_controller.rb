class PostsController < ApplicationController
before_action :find_current_post, only: [:show, :edit, :update, :destroy] 

 def index
 
  end

  def show
    
  end

  def edit
    if @post == nil
      redirect_to url_for(:controller => :posts, :action => :new)
      return
    end 
  end

  def update
    if @post.update(post_params)
      redirect_to url_for(:controller => :posts, :action => :show, :id => @post.id)
    else
      render :edit
    end
  end

  def new
    authenticate_user!
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to url_for(:controller => :posts, :action => :show, :id => @post.id)
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
     authenticate_user!
     @post = Post.where(id: params[:id]).take
  end

end
