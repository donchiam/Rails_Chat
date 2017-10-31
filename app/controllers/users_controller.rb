  class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @is_admin = current_user && current_user.id == @user.id
  end

  # GET /users/new
  def new
    if current_user
    redirect_to home_index_path, :notice => "You are already registered"
    end
    @user = User.new
    render layout: 'welcome'
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
    redirect_to @user
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        redirect_to home_index_path, notice: 'Profile successfully created'
      else
        render action: "new"
      end
  end

  # POST /users.json
  

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
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :username, :email, :password, :image)
    end
end
