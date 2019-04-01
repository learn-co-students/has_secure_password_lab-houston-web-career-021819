class UsersController < ApplicationController
  def new
  end
  
  def create
    @user = User.new
    if @user.update(user_params) && params[:password] == params[:password_confirmation]
      session[:user_id] = @user.id
    else 
      redirect_to controller: 'users', action: 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
