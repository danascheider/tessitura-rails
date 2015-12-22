class UsersController < ApplicationController
  before_action :set_user, only: [:dashboard, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:new, :create, :index]
  before_action :admin_only!, only: [:index]
  layout "dashboard", except: [:create, :new]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def dashboard
    redirect_to dashboard_user_path(@user) unless params[:id].to_i == @user.id
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def admin_only!
      authenticate_user!

      if !user_logged_in?
        redirect_to new_user_session_path
      elsif !user.admin?
        redirect_to @user
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if current_user
        @user = current_user.admin ? User.find(params[:id]) : current_user
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :email, :email_confirmation, :first_name, :last_name, :birthdate, :address_1, :address_2, :city, :state, :zip, :fach_id, :admin)
    end
end
