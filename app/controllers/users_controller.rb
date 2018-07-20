class UsersController < ApplicationController

  http_basic_authenticate_with name: "name", password: "password", except: [:index, :show]

  def signup
    @user = User.new
  end

  def create
    @user = User.new(username: params[:user][:username], password: params[:user][:password])

    if @user.save
      redirect_to users_path
    else
      render 'signup'
    end
  end

  def show
    if @users.any?
      @user = User.find(params[:username])
    end
  end

  def edit
    @user = User.find(params[:username])
  end

  def update
    @user = User.find(params[:username])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:username])
    @user.destroy

    redirect_to users_path
  end

  def new_session
    user = User.find_by(username: params[:username])
    render :login unless user.present?
    if user.password == params[:password]
      session[:user_id] = user.id
      redirect_to welcome_index_path
    else
      render :login
    end
  end

  def index
    @users = User.all
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
