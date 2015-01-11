require 'rails_helper'

RSpec.describe CommunitiesController, :type => :controller do

 context 'when user not logged in' do
    let(:community) {FactoryGirl.create(:community)}

    describe "Get community_profile" do
      it 'redirect to login page' do
         get :show, :id => community.id
         expect(response).to redirect_to new_user_session_path
      end
    end


   describe "Edit community_profile" do
      it 'redirect to login page' do
         get :edit, :id => community.id
         expect(response).to redirect_to new_user_session_path
      end
    end

   describe "New community_profile" do
      it 'redirect to login page' do
         get :new
         expect(response).to redirect_to new_user_session_path
      end
    end

  end


 context 'when user logged in as community with community data' do
    let(:community) {FactoryGirl.create(:community)}

    before do
      sign_in community.user

    end

    describe "GET community profile"
      it 'get community profile' do
         get :show, :id => community.id
         expect(response).to render_template :show
      end

    describe "GET new community"
      it 'assigns new community' do
         get :new
         expect(assigns(:community)).to be_new_record
      end

    describe "render new community"
      it 'render new community ' do
         get :new
         expect(response).to render_template :new
      end

  describe "GET #edit" do
    it "edit community data" do
     get :edit, id: community
     expect(assigns(:community)).to eq(community)
   end

   it "renders the :edit view" do
    get :edit, id: community
    expect(response).to render_template :edit
   end
  end



  end

end
