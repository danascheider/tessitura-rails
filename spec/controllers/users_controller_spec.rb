require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::TestHelpers

  let(:valid_attributes) {
    {
      username: 'foobarbaz256',
      password: 'raboof333',
      password_confirmation: 'raboof333',
      email: 'foobar@baz.com',
      first_name: 'Jacob',
      last_name: 'Boyle'
    }
  }

  let(:invalid_attributes) {
    {username: nil}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all users as @users" do
      pending 'This route should only be accessible to admins'
      user = FactoryGirl.create(:user)
      get :index, {}, valid_session
      expect(assigns(:users)).to eq(User.all)
    end
  end

  describe "GET #show" do
    it "assigns the requested user as @user" do
      user = FactoryGirl.create(:user)
      get :show, {:id => user.to_param}, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #new" do
    it "assigns a new user as @user" do
      get :new, {}, valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "GET #edit" do
    it "assigns the requested user as @user" do
      user = FactoryGirl.create(:user)
      get :edit, {:id => user.to_param}, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      before(:each) do 
        UserMailer.deliveries.clear
      end

      it "creates a new User" do
        expect {
          post :create, {:user => valid_attributes}, valid_session
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {:user => valid_attributes}, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "redirects to the created user" do
        post :create, {:user => valid_attributes}, valid_session
        expect(response).to redirect_to(User.last)
      end

      it "sends the e-mail" do 
        post :create, {:user => valid_attributes}, valid_session
        expect(User.last.confirmation_sent_at).not_to be_nil
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {address_1: '123 Main St.'}
      }

      it "updates the requested user" do
        user = FactoryGirl.create(:user)
        sign_in user
        put :update, {:id => user.to_param, :user => new_attributes}, valid_session
        user.reload
        expect(user.address_1).to eql '123 Main St.'
      end

      it "assigns the requested user as @user" do
        user = FactoryGirl.create(:user)
        sign_in user
        put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "redirects to the user" do
        user = FactoryGirl.create(:user)
        sign_in user
        put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
        expect(response).to redirect_to(user)
      end
    end

    context "with invalid params" do
      it "assigns the user as @user" do
        user = FactoryGirl.create(:user)
        sign_in user
        put :update, {:id => user.to_param, :user => invalid_attributes}, valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "re-renders the 'edit' template" do
        user = FactoryGirl.create(:user)
        sign_in user
        put :update, {:id => user.to_param, :user => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = FactoryGirl.create(:user)
      sign_in user
      expect {
        delete :destroy, {:id => user.to_param}, valid_session
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = FactoryGirl.create(:user)
      sign_in user
      delete :destroy, {:id => user.to_param}, valid_session
      expect(response).to redirect_to(users_url)
    end
  end
end
