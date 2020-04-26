class UsersController < ApplicationController

  def index
  	@users= User.where(admin: false)
  end

  def assign_role
    @user = User.find(params['id'])
  end

  def set_role
    @user = User.find(params['id'])
    @user.update_attributes(role_id: params['user']['role_id'])
    redirect_to users_path
  end
end
