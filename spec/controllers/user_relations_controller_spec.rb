require 'rails_helper'

RSpec.describe UserRelationsController, :type => :controller do

context 'when user not logged in' do
    let(:user_relation) {FactoryGirl.create(:user_relation)}

    describe "Get user_relation" do
      it 'redirect to login page' do
         get :show, :id => user_relation.id
         expect(response).to redirect_to new_user_session_path
      end
    end



   describe "New user_relation" do
      it 'redirect to login page' do
         get :new
         expect(response).to redirect_to new_user_session_path
      end
    end


  describe "Delete user_relation" do
      it 'redirect to login page' do
         delete :destroy, id: user_relation
         expect(response).to redirect_to new_user_session_path
      end
    end

  end

 context 'when user logged in ' do
    let(:user_relation) {FactoryGirl.create(:user_relation)}

    before do
      sign_in user_relation.user

    end

    describe "GET user_relation profile"
      it 'get user_relation profile' do
         get :show, :id => user_relation.id
         expect(response).to render_template :show
      end

    describe "GET new user_relation"
      it 'assigns new user_relation' do
         get :new
         expect(assigns(:user_relation)).to be_new_record
      end

    describe "render new user_relation"
      it 'render new user_relation ' do
         get :new
         expect(response).to render_template :new
      end

  describe 'DELETE #destroy' do
   before(:each) {
   @user_relation = FactoryGirl.create :user_relation
   }
   it "deletes the user_relation" do
   expect {delete :destroy, id: @user_relation}.to change(UserRelation, :count).by(-1)
   end

  it "redirects to user_profile" do
   user_id = @user_relation.user_owner_id
   delete :destroy, id: @user_relation
   expect(response).to redirect_to user_root_path 
  end
  end#

  end

end
