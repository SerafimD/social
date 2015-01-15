require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

context 'when user not logged in' do
    let(:post) {FactoryGirl.create(:post)}

    describe "Get post" do
      it 'redirect to login page' do
         get :show, :id => post.id
         expect(response).to redirect_to new_user_session_path
      end
    end



   describe "New post" do
      it 'redirect to login page' do
         get :new
         expect(response).to redirect_to new_user_session_path
      end
    end

  describe "Edit post" do
      it 'redirect to login page' do
         get :edit, :id => post.id
         expect(response).to redirect_to new_user_session_path
      end
    end

  describe "Delete post" do
      it 'redirect to login page' do
         delete :destroy, id: post
         expect(response).to redirect_to new_user_session_path
      end
    end

  end

 context 'when user logged in ' do
    let(:post) {FactoryGirl.create(:post)}

    before do
      sign_in post.user

    end

    describe "GET post profile"
      it 'get post profile' do
         get :show, :id => post.id
         expect(response).to render_template :show
      end

    describe "GET new post"
      it 'assigns new post' do
         get :new
         expect(assigns(:post)).to be_new_record
      end

    describe "render new post"
      it 'render new post ' do
         get :new
         expect(response).to render_template :new
      end

 describe "GET #edit" do
    it "edit post data" do
     get :edit, id: post
     expect(assigns(:post)).to eq(post)
   end

   it "renders the :edit view" do
    get :edit, id: post
    expect(response).to render_template :edit
   end
  end

  describe 'DELETE #destroy' do
   before(:each) {
   @post = FactoryGirl.create :post
   }
   it "deletes the post" do
   expect {delete :destroy, id: @post}.to change(Post, :count).by(-1)
   end

  it "redirects to user_profile" do
   delete :destroy, id: @post
   expect(response).to redirect_to user_root_path 
  end
  end#

  end

end
