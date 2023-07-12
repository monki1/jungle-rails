class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render :new
      #redirect_to '/signup'
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :firstname,
      :lastname,
      :email,
      :password,
      :password_confirmation)
  end

end