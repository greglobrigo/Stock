class AdminController < ApplicationController
  before_action :user_params_update, only: [:updateuser]
  before_action :user_params_create, only: [:createuser]
  before_action :authenticate_admin!

  def index
    @users = User.all    
    @pending_users = User.find_by_sql("SELECT * FROM users WHERE status = 'pending'")
  end

  def showuser
    @user = User.find(params[:id])
  end

  def edituser
    @user = User.find(params[:id])
  end

  def updateuser
    @user = User.find(params[:id])
    if @user.update(user_params_update)
      redirect_to '/admin'
    else
      render "/admin/edituser"
    end
  end

  def newuser
    @user = User.new
  end

  def createuser
    @user = User.new(user_params_create)
    if @user.save
      redirect_to admin_path
    else
      render "/admin/newuser"
    end
  end

  def approveuser
    @user = User.find(params[:id])
    @user.status = 'approved'    
    @user.save
    redirect_to '/admin'
  end

  private

  def user_params_update
    params.require(:user).permit(:full_name)
  end

  def user_params_create
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
  end
end
