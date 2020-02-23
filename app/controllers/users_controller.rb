class UsersController < ApplicationController

  before_action :find_user, only: [:show, :destroy, :update, :edit]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Fred Blog #{@user.username}"
      redirect_to articles_path
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
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy

    @user.destroy
    flash[:danger] = "#{@user.username} was successfully deleted"
    redirect_to users_path
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def find_user
      @user = User.find(params[:id])
    end

end
