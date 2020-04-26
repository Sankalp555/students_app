class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  def index
    @roles = Role.all
  end

  def show
  end

  def new
    @role = Role.new
  end

  def edit
    @role = Role.find(params['id'])
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      redirect_to roles_path
    else
      format.html { render :new }
    end
  end

  def update
    if @role.update(role_params)
      redirect_to roles_path
    else
      format.html { render :edit }
    end
  end

  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url, notice: 'Role was successfully destroyed.' }
    end
  end

  private
    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:name, :can_create, :can_edit, :can_destroy)
    end
end
