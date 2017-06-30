class SessionsController < ApplicationController
  def new
  end

  def create

    # first, try and find the user by email in the db
    @user = User.find_by_email(params[:login][:email])

    if @user && @user.authenticate(params[:login][:password])
    #generate a cookie for the user
    #redirext them somewhere
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
