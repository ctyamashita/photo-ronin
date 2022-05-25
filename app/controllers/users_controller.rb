class UsersController < ApplicationController
  def dashboard
    @lists = policy_scope(List.where(user: current_user))
    authorize @lists
  end
end
