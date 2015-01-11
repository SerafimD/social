require 'rails_helper'

RSpec.describe CommunityMembershipsController, :type => :controller do

 context 'when user not logged in' do
    let(:community_membership) {FactoryGirl.create(:community_membership)}

    describe "Get community_membership" do
      it 'redirect to login page' do
         get :show, :id => community_membership.id
         expect(response).to redirect_to new_user_session_path
      end
    end



   describe "New community_membership" do
      it 'redirect to login page' do
         get :new
         expect(response).to redirect_to new_user_session_path
      end
    end


  describe "Delete community_membership" do
      it 'redirect to login page' do
         delete :destroy, id: community_membership
         expect(response).to redirect_to new_user_session_path
      end
    end

  end

context 'when user logged in as community with community data' do
    let(:community_membership) {FactoryGirl.create(:community_membership)}

    before do
      sign_in community_membership.community.user

    end

    describe "GET community_membership profile"
      it 'get community_membership profile' do
         get :show, :id => community_membership.id
         expect(response).to render_template :show
      end

    describe "GET new community_membership"
      it 'assigns new community_membership' do
         get :new
         expect(assigns(:community_membership)).to be_new_record
      end

    describe "render new community_membership"
      it 'render new community_membership ' do
         get :new
         expect(response).to render_template :new
      end

  describe 'DELETE #destroy' do
   before(:each) {
   @community_membership = FactoryGirl.create :community_membership
   }
   it "deletes the community_membership" do
   expect {delete :destroy, id: @community_membership}.to change(CommunityMembership, :count).by(-1)
   end

  it "redirects to community" do
   community_id = @community_membership.community_id
   delete :destroy, id: @community_membership
   expect(response).to redirect_to :controller => :communities, :action => :show, :id => community_id 
  end
  end#

  end

end
