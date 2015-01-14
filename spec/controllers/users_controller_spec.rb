require 'rails_helper'

RSpec.describe UsersController, :type => :controller do


  context 'when user not logged in' do
    describe "GET user_profile" do
      it 'redirect to login page' do
         get :show_profile
         expect(response).to redirect_to new_user_session_path
      end
    end
  end


  context 'when user logged in as person, but no person data' do
    let(:user) {FactoryGirl.create(:user_person)}

    before do
      sign_in user

    end

    describe "GET user_profile if user"
      it 'redirect person#new view' do
         get :show_profile
         expect(response).to redirect_to  new_person_path
      end

  end

  context 'when user logged in as person with person data' do
    let(:person) {FactoryGirl.create(:person)}

    before do
      sign_in person.user

    end

    describe "GET user_profile if user"
      it 'redirect person#show view' do
         get :show_profile
         expect(response).to redirect_to  :controller => :people, :action => :show, :id => person.id
      end

  end




  context 'when user logged in as community, but no community data' do
    let(:user) {FactoryGirl.create(:user_community)}

    before do
      sign_in user

    end

    describe "GET user_profile if community"
      it 'redirect community#new view' do
         get :show_profile
         expect(response).to redirect_to  new_community_path
      end

  end

  context 'when user logged in as community with community data' do
    let(:community) {FactoryGirl.create(:community)}

    before do
      sign_in community.user

    end

    describe "GET community_profile if user"
      it 'redirect person#show view' do
         get :show_profile
         expect(response).to redirect_to  :controller => :communities, :action => :show, :id => community.id
      end

  end



end
