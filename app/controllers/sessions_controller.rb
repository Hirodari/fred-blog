class SessionsController < ApplicationController

  def new
  end

  def create
    #debugger
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = " successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    #debugger
    user = User.find_by(id: session[:user_id])
    session[:user_id] = nil
    flash[:success] = "#{user.username} is logged out"
    redirect_to root_path
  end



end
