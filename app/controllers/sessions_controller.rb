class SessionsController < ApplicationController

    skip_before_action :authenticate, :only => [:new, :create]

    def new
    end

    def create
        @user = User.find_by(username: session_params[:username])
        return head(:forbidden) unless @user.authenticate(session_params[:password])
        session[:user_id] = @user.id
        session[:username] = @user.username
        redirect_to "/users/#{@user.id}"
      end

    def destroy
        session.delete :username
        session.delete :id
		redirect_to '/sessions/new'
	end
    
    private

    def session_params
        params.require(:user).permit(:password, :username)
    end
end
