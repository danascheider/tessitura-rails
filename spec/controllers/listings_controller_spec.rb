require 'rails_helper'

RSpec.describe ListingsController, type: :controller do
  include Devise::TestHelpers

  let(:admin) { FactoryGirl.create(:admin) }

  let(:valid_attributes) {
    { title: 'Super Awesome Summer Program' }
  }

  let(:invalid_attributes) {
    { title: nil }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all listings as @listings" do
      listing = FactoryGirl.create(:listing, valid_attributes)
      sign_in admin
      get :index, {}, valid_session
      expect(assigns(:listings)).to eq([listing])
    end
  end

  describe "GET #show" do
    it "assigns the requested listing as @listing" do
      listing = FactoryGirl.create(:listing, valid_attributes)
      sign_in admin
      get :show, {:id => listing.to_param}, valid_session
      expect(assigns(:listing)).to eq(listing)
    end
  end

  describe "GET #new" do
    it "assigns a new listing as @listing" do
      sign_in admin
      get :new, {}, valid_session
      expect(assigns(:listing)).to be_a_new(Listing)
    end
  end

  describe "GET #edit" do
    it "assigns the requested listing as @listing" do
      listing = FactoryGirl.create(:listing, valid_attributes)
      sign_in admin
      get :edit, {:id => listing.to_param}, valid_session
      expect(assigns(:listing)).to eq(listing)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Listing" do
        sign_in admin
        expect {
          post :create, {:listing => valid_attributes}, valid_session
        }.to change(Listing, :count).by(1)
      end

      it "assigns a newly created listing as @listing" do
        sign_in admin
        post :create, {:listing => valid_attributes}, valid_session
        expect(assigns(:listing)).to be_a(Listing)
        expect(assigns(:listing)).to be_persisted
      end

      it "re-renders the :new view" do
        sign_in admin
        post :create, {:listing => valid_attributes}, valid_session
        expect(response).to redirect_to(new_listing_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved listing as @listing" do
        sign_in admin
        post :create, {:listing => invalid_attributes}, valid_session
        expect(assigns(:listing)).to be_a_new(Listing)
      end

      it "re-renders the 'new' template" do
        sign_in admin
        post :create, {:listing => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { title: 'Summer Program That Is Super Awesome' }
      }

      it "updates the requested listing" do
        listing = FactoryGirl.create(:listing, valid_attributes)
        sign_in admin
        put :update, {:id => listing.to_param, :listing => new_attributes}, valid_session
        listing.reload
        expect(listing.title).to eql "Summer Program That Is Super Awesome"
      end

      it "assigns the requested listing as @listing" do
        listing = FactoryGirl.create(:listing, valid_attributes)
        sign_in admin
        put :update, {:id => listing.to_param, :listing => valid_attributes}, valid_session
        expect(assigns(:listing)).to eq(listing)
      end

      it "redirects to the listing" do
        listing = FactoryGirl.create(:listing, valid_attributes)
        sign_in admin
        put :update, {:id => listing.to_param, :listing => valid_attributes}, valid_session
        expect(response).to redirect_to(listing)
      end
    end

    context "with invalid params" do
      it "assigns the listing as @listing" do
        listing = FactoryGirl.create(:listing, valid_attributes)
        sign_in admin
        put :update, {:id => listing.to_param, :listing => invalid_attributes}, valid_session
        expect(assigns(:listing)).to eq(listing)
      end

      it "re-renders the 'edit' template" do
        listing = FactoryGirl.create(:listing, valid_attributes)
        sign_in admin
        put :update, {:id => listing.to_param, :listing => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested listing" do
      listing = FactoryGirl.create(:listing, valid_attributes)
      sign_in admin

      expect {
        delete :destroy, {:id => listing.to_param}, valid_session
      }.to change(Listing, :count).by(-1)
    end

    it "redirects to the listings list" do
      listing = FactoryGirl.create(:listing, valid_attributes)
      sign_in admin
      delete :destroy, {:id => listing.to_param}, valid_session
      expect(response).to redirect_to(listings_url)
    end
  end

end
