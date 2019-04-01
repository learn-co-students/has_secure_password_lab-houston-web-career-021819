class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:user][:name] == nil || params[:user][:name] == ''
      redirect_to controller: 'sessions', action: 'new'
    else
      @user = User.find_by(name: params[:user][:name])
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
    end
  end
end
