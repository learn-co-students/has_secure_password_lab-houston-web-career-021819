class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate

  def authenticate
    if session[:username] == nil
        redirect_to '/sessions/new'
    end
  end

  # def current_user
  #     session[:username]
  # end

  # def index
  #     if current_user
  #     else
  #         raise "Unauthorized"
  #     end
  # end

end
