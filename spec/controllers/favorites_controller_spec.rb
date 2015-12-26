require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do
  include Devise::TestHelpers

  let(:user) { FactoryGirl.create(:user) }

  let(:listings) { FactoryGirl.create_list(:listing, 2) }

  let(:valid_attributes) {
    { user_id: user.id, listing_id: listings[0].id }
  }

  let(:invalid_attributes) {
    {user_id: nil}
  }
  let(:valid_session) { {} }

  before(:each) do 
    allow_any_instance_of(ActionController::Base).to receive(:current_user).and_return(user)
  end

  describe "GET #index" do
    it "assigns all a user's favorites as @favorites" do
      favorite = Favorite.create! valid_attributes
      sign_in user
      get :index, {user_id: user.id}, valid_session
      expect(assigns(:favorites)).to eq([listings[0]])
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Favorite" do
        valid_attributes
        sign_in user
        expect {
          post :create, {:favorite => valid_attributes, :user_id => user.to_param}, valid_session
        }.to change(Favorite, :count).by(1)
      end

      it "assigns a newly created favorite as @favorite" do
        post :create, {:favorite => valid_attributes, :user_id => user.to_param}, valid_session
        expect(assigns(:favorite)).to be_a(Favorite)
        expect(assigns(:favorite)).to be_persisted
      end

      it "redirects to the user's favorites" do
        post :create, {:favorite => valid_attributes, :user_id => user.to_param}, valid_session
        expect(response).to redirect_to(user_favorites_path(user))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved favorite as @favorite" do
        sign_in user
        post :create, {:favorite => invalid_attributes, :user_id => user.to_param}, valid_session
        expect(assigns(:favorite)).to be_a_new(Favorite)
      end

      it "goes back to the list of favorites" do
        post :create, {:favorite => invalid_attributes, :user_id => user.to_param}, valid_session
        expect(response).to render_template("index")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested favorite" do
      favorite = Favorite.create! valid_attributes
      expect {
        delete :destroy, {:id => favorite.to_param, :user_id => user.to_param}, valid_session
      }.to change(Favorite, :count).by(-1)
    end

    it "redirects to the favorites list" do
      favorite = Favorite.create! valid_attributes
      delete :destroy, {:id => favorite.to_param, :user_id => user.to_param}, valid_session
      expect(response).to redirect_to(user_favorites_url(user))
    end
  end

end
