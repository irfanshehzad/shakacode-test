class HomeController < ApplicationController
  def index
    @paginator = Pagination.new(User, params[:page].present? ? params[:page] : 1)
    @users = @paginator.records
  end
end
