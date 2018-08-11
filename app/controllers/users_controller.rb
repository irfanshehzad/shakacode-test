class UsersController < ApplicationController
  before_action :authenticate!
  before_action :authorize!
  before_action :set_user, only: [:edit,:update]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(allowed_user_params)
    if @user.save
      flash[:notice] = "User created successfully."
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages.join(',')
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    if @user.update(allowed_user_params)
      flash[:notice] = "User updated successfully."
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages.join(',')
      render :edit
    end
  end
  
  private
  
  def set_user
    @user = User.find params[:id]
  end
  
  def allowed_user_params
    params.require(:user).permit!
  end
  
end
