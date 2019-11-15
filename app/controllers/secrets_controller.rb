class SecretsController < ApplicationController
  before_action :logged_in?

  def show
  end

  private

  def logged_in?
    return if current_user

    redirect_to '/login'
  end
end