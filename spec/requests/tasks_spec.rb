require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  include Warden::Test::Helpers

  let(:user) { FactoryGirl.create(:user_with_tasks) }

  let(:valid_attributes) { { title: 'Foobar', status: 'In Progress', priority: 'Normal' } }

  let(:invalid_attributes) { { title: nil } }

  before(:each) do 
    Warden.test_mode!
  end

  after(:each) do 
    Warden.test_reset!
  end

  describe "GET /users/:id/tasks" do
    it "returns status 200" do 
      login_as(user, scope: :user, run_callbacks: false)
      get user_tasks_path(user), {user_id: user.id}
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /tasks/:id" do 
    it "returns status 200" do 
      login_as(user, scope: :user, run_callbacks: false)
      get task_path(user.tasks.first, {user_id: user.id})
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /users/:id/tasks" do 
    context "valid attributes" do 
      it "returns status 302" do 
        login_as(user, scope: :user, run_callbacks: false)
        post user_tasks_path(user), {user_id: user.id, task: valid_attributes}
        expect(response).to have_http_status(302)
      end

      it "redirects to the user's task index" do 
        login_as(user, scope: :user, run_callbacks: false)
        post user_tasks_path(user), {user_id: user.id, task: valid_attributes}
        expect(response).to redirect_to user_tasks_path(user)
      end
    end

    context "invalid attributes" do      
      it "renders the new task view" do 
        allow_any_instance_of(ActionController::Base).to receive(:current_user).and_return(user)
        login_as(user, scope: :user, run_callbacks: false)
        post user_tasks_path(user), { user_id: user.to_param, task: invalid_attributes }
        expect(response).to render_template :new
      end
    end
  end
end