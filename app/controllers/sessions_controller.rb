class SessionsController < ApplicationController

  def index
  end

  def create
    session[:name] = params[:name]
    if current_user.nil? || current_user.empty?
      redirect_to '/'
    else
      redirect_to '/home'
    end
  end

  def destroy
    if !current_user.blank?
      session[:name] = nil
      redirect_to '/'
    else

      redirect_to '/'
    end
  end
end
