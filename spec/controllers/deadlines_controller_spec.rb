require 'rails_helper'

RSpec.describe DeadlinesController, type: :controller do
  let(:listing) { FactoryGirl.create(:listing) }

  let(:valid_attributes) {
    { date: Date.current, listing_id: listing.id }
  }

  let(:invalid_attributes) {
    { date: nil }
  }

  let(:valid_session) { {} }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Deadline" do
        expect {
          post :create, {:listing_id => listing.id, :deadline => valid_attributes}, valid_session
        }.to change(Deadline, :count).by(1)
      end

      it "assigns a newly created deadline as @deadline" do
        post :create, {:deadline => valid_attributes, :listing_id => listing.to_param}, valid_session
        expect(assigns(:deadline)).to be_a(Deadline)
        expect(assigns(:deadline)).to be_persisted
      end

      it "redirects to the listing" do
        post :create, {:listing_id => listing.id, :deadline => valid_attributes}, valid_session
        expect(response).to redirect_to(Deadline.last.listing)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved deadline as @deadline" do
        post :create, {:listing_id => listing.to_param, :deadline => invalid_attributes}, valid_session
        expect(assigns(:deadline)).to be_a_new(Deadline)
      end

      it "redirects to the listings" do
        post :create, {:listing_id => listing.to_param, :deadline => invalid_attributes}, valid_session
        expect(response).to redirect_to(listings_path)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { description: 'Materials received' }
      }

      it "updates the requested deadline" do
        deadline = FactoryGirl.create(:deadline)
        put :update, {:id => deadline.to_param, :deadline => new_attributes}, valid_session
        deadline.reload
        expect(deadline.description).to eql 'Materials received'
      end

      it "assigns the requested deadline as @deadline" do
        deadline = FactoryGirl.create(:deadline)
        put :update, {:id => deadline.to_param, :deadline => valid_attributes}, valid_session
        expect(assigns(:deadline)).to eq(deadline)
      end

      it "redirects to the deadline" do
        deadline = FactoryGirl.create(:deadline)
        put :update, {:id => deadline.to_param, :deadline => valid_attributes}, valid_session
        expect(response).to redirect_to(deadline)
      end
    end

    context "with invalid params" do
      it "assigns the deadline as @deadline" do
        deadline = FactoryGirl.create(:deadline)
        put :update, {:id => deadline.to_param, :deadline => invalid_attributes}, valid_session
        expect(assigns(:deadline)).to eq(deadline)
      end

      it "redirects to the listing's edit form" do
        deadline = FactoryGirl.create(:deadline)
        put :update, {:id => deadline.to_param, :deadline => invalid_attributes}, valid_session
        expect(response).to redirect_to edit_listing_path(deadline.listing)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested deadline" do
      deadline = FactoryGirl.create(:deadline)
      expect {
        delete :destroy, {:id => deadline.to_param}, valid_session
      }.to change(Deadline, :count).by(-1)
    end

    it "redirects to the listing" do
      deadline = FactoryGirl.create(:deadline)
      delete :destroy, {:id => deadline.to_param}, valid_session
      expect(response).to redirect_to(listing_path(deadline.listing))
    end
  end

end
