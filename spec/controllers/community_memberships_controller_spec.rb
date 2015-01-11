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


end
