class ListsController < ApplicationController
  def index
    @list = List.all
  end
end
