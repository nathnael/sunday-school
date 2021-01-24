class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :user_permissions, :updatePermissions]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    
    @all_permissions = Permission.all   
    @unique_permissions = Permission.pluck(:name).uniq!
  end

  def user_permissions
    # @user = User.find(params[:id])
    @all_permissions = Permission.all
    @unique_permissions = Permission.pluck(:name).uniq!
  end

  def updatePermissions
    if(params[:permissions].present?)
      new_permissions = params.require(:permissions)
      UserPermission.where(user_id: @user.id).destroy_all

      new_permissions.each do |permission|
        _permission = UserPermission.new ({
          permission_id: permission[0].to_i,
          user_id: @user.id
        })
        _permission.modified_by = current_user.id
        _permission.save
      end
    else
      UserPermission.where(user_id: @user.id).destroy_all
    end
    redirect_to @user, success: 'User profile was successfully updated.'
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.created_by = current_user.id
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, success: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user.modified_by = current_user.id
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, success: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name)
    end
end
