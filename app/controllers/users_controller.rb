class UsersController < SessionsController
  def new
    @user = User.new
  end

  def create
    if user_params(:password)[:password] == user_params(:password_confirmation)[:password_confirmation]
      @user = User.create(user_params(:name, :password))
      session[:user_id] = @user.id
    else
      redirect_to new_user_path
    end
  end

  private

    def user_params(*args)
      params.require(:user).permit(*args)
    end
end
