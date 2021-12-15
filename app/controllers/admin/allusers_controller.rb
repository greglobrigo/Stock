class Admin::AllusersController < ApplicationController
  def index
    @users = User.all
    render 'admins/allusers'
  end
end
