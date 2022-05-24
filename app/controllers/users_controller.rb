class UsersController < ApplicationController
  def dashboard
    @lists = policy_scope(List.all)
    authorize @lists
  end
end
