class UsersController < ApplicationController
  def dashboard
    @lists = List.where(user: current_user)
  end
end
