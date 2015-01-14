require 'rails_helper'

RSpec.describe PeopleController, :type => :controller do

 context 'when user not logged in' do
    let(:person) {FactoryGirl.create(:person)}

    describe "Get people_profile" do
      it 'redirect to login page' do
         get :show, :id => person.id
         expect(response).to redirect_to new_user_session_path
      end
    end


   describe "Edit people_profile" do
      it 'redirect to login page' do
         get :edit, :id => person.id
         expect(response).to redirect_to new_user_session_path
      end
    end

   describe "New people_profile" do
      it 'redirect to login page' do
         get :new
         expect(response).to redirect_to new_user_session_path
      end
    end

  end


 context 'when user logged in as person with person data' do
    let(:person) {FactoryGirl.create(:person)}

    before do
      sign_in person.user

    end

    describe "GET person profile"
      it 'get person profile' do
         get :show, :id => person.id
         expect(response).to render_template :show
      end

    describe "GET new person"
      it 'assigns new person' do
         get :new
         expect(assigns(:person)).to be_new_record
      end

    describe "render new person"
      it 'render new person ' do
         get :new
         expect(response).to render_template :new
      end

  describe "GET #edit" do
    it "edit person data" do
     get :edit, id: person
     expect(assigns(:person)).to eq(person)
   end

   it "renders the :edit view" do
    get :edit, id: person
    expect(response).to render_template :edit
   end
  end

  end


end
