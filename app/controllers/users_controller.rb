class UsersController < ApplicationController

  before_action :find_user, only: [:show, :destroy, :update, :edit]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Fred Blog #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def Show

  end

  def edit

  end

  def update

    if @user.update(user_params)
      flash[:success] = "#{@user.username} was updated with success"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

def destroy

  @user.destroy
  flash[:danger] = "#{@user.username} was successfully deleted and his/her articles"
  redirect_to users_path
end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def find_user
      @user = User.find(params[:id])
    end

    def require_same_user
      if current_user != @user && !current_user.admin?
        flash[:danger] = "You can only edit, update your own account"
        redirect_to root_path
      end
    end

    def require_admin
      if !logged_in? && !current_user.admin?
        flash[:danger] = "Only admin can perform this action"
        redirect_to root_path
      end
    end

end
