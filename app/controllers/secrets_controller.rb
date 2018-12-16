class SecretsController < ApplicationController
  before_action :require_login
  def show
    if current_user
      render 'show'
    else
      redirect_to '/'
    end
  end

  private
  def require_login
    redirect_to '/' if current_user.blank?
  end
end
