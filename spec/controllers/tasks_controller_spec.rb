require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  include Devise::TestHelpers

  let(:users) { FactoryGirl.create_list(:user, 2) }
  
  let(:valid_attributes) {
    { title: 'My Task', priority: 'Normal' }
  }

  let(:invalid_attributes) {
    { title: nil }
  }

  let(:valid_session) { {} }

  describe "GET #index" do

    it "assigns the user's tasks as @tasks" do
      task = FactoryGirl.create(:task)
      sign_in task.user
      get :index, {user_id: task.user.id}, valid_session
      expect(assigns(:tasks)).to eq([task])
    end

    it "doesn't include other users' tasks" do 
      task_1 = FactoryGirl.create(:task)
      task_2 = FactoryGirl.create(:task)
      sign_in task_1.user
      get :index, {user_id: task_1.user}, valid_session
      expect(assigns(:tasks)).to eq(Task.where(:user_id => task_1.user_id))
    end
  end

  describe "GET #show" do
    it "assigns the requested task as @task" do
      task = FactoryGirl.create(:task)
      sign_in task.user
      get :show, {:id => task.to_param, :user_id => task.user.to_param}, valid_session
      expect(assigns(:task)).to eq(task)
    end
  end

  describe "GET #new" do
    it "assigns a new task as @task" do
      sign_in user = FactoryGirl.create(:user)
      get :new, {:user_id => user.id}, valid_session
      expect(assigns(:task)).to be_a_new(Task)
    end
  end

  describe "GET #edit" do
    it "assigns the requested task as @task" do
      task = FactoryGirl.create:task
      sign_in task.user
      get :edit, {:id => task.to_param, :user_id => task.user.to_param}, valid_session
      expect(assigns(:task)).to eq(task)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Task" do
        expect {
          sign_in user = FactoryGirl.create(:user)
          post :create, {:user_id => user.id, :task => valid_attributes}, valid_session
        }.to change(Task, :count).by(1)
      end

      it "assigns a newly created task as @task" do
        sign_in user = FactoryGirl.create(:user)
        post :create, {:user_id => user.id, :task => valid_attributes}, valid_session
        expect(assigns(:task)).to be_a(Task)
        expect(assigns(:task)).to be_persisted
      end

      it "redirects to the created task" do
        sign_in user = FactoryGirl.create(:user)
        post :create, {:user_id => user.id, :task => valid_attributes}, valid_session
        expect(response).to redirect_to(Task.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved task as @task" do
        sign_in user = FactoryGirl.create(:user)
        post :create, {:user_id => user.to_param, :task => invalid_attributes}, valid_session
        expect(assigns(:task)).to be_a_new(Task)
      end

      it "re-renders the 'new' template" do
        sign_in user = FactoryGirl.create(:user)
        post :create, {:user_id => user.to_param, :task => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { status: 'Blocking' }
      }

      it "updates the requested task" do
        task = FactoryGirl.create(:task)
        sign_in task.user
        put :update, {:id => task.to_param, :user_id => task.user.to_param, :task => new_attributes}, valid_session
        task.reload
        expect(task.status).to eql 'Blocking'
      end

      it "assigns the requested task as @task" do
        task = FactoryGirl.create(:task)
        sign_in task.user
        put :update, {:id => task.to_param, :user_id => task.user.to_param, :task => valid_attributes}, valid_session
        expect(assigns(:task)).to eq(task)
      end

      it "redirects to the task" do
        task = FactoryGirl.create(:task)
        sign_in task.user
        put :update, {:id => task.to_param, :user_id => task.user.to_param, :task => valid_attributes}, valid_session
        expect(response).to redirect_to(task)
      end
    end

    context "with invalid params" do
      it "assigns the task as @task" do
        task = FactoryGirl.create(:task)
        sign_in task.user
        put :update, {:id => task.to_param, :user_id => task.user.to_param, :task => invalid_attributes}, valid_session
        expect(assigns(:task)).to eq(task)
      end

      it "re-renders the 'edit' template" do
        task = FactoryGirl.create(:task)
        sign_in task.user
        put :update, {:id => task.to_param, :user_id => task.user.to_param, :task => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested task" do
      task = FactoryGirl.create(:task)
      expect {
        sign_in task.user
        delete :destroy, {:id => task.to_param, :user_id => task.user.to_param}, valid_session
      }.to change(Task, :count).by(-1)
    end

    it "redirects to the tasks list" do
      task = FactoryGirl.create(:task)
      sign_in task.user
      delete :destroy, {:id => task.to_param, :user_id => task.user.to_param}, valid_session
      expect(response).to redirect_to(user_tasks_url(task.user.id))
    end
  end

end
