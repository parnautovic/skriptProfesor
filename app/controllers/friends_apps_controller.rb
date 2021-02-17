class FriendsAppsController < ApplicationController
  before_action :set_friends_app, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /friends_apps
  # GET /friends_apps.json
  def index
    @friends_apps = FriendsApp.all
  end

  # GET /friends_apps/1
  # GET /friends_apps/1.json
  def show
  end

  # GET /friends_apps/new
  def new
    #@friends_app = FriendsApp.new
    @friends_app = current_user.friends_apps.build 
  end

  # GET /friends_apps/1/edit
  def edit
  end

  # POST /friends_apps
  # POST /friends_apps.json
  def create
    #@friends_app = FriendsApp.new(friends_app_params)
    @friends_app = current_user.friends_apps.build(friends_app_params)
    respond_to do |format|
      if @friends_app.save
        format.html { redirect_to @friends_app, notice: 'Friends app was successfully created.' }
        format.json { render :show, status: :created, location: @friends_app }
      else
        format.html { render :new }
        format.json { render json: @friends_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends_apps/1
  # PATCH/PUT /friends_apps/1.json
  def update
    respond_to do |format|
      if @friends_app.update(friends_app_params)
        format.html { redirect_to @friends_app, notice: 'Friends app was successfully updated.' }
        format.json { render :show, status: :ok, location: @friends_app }
      else
        format.html { render :edit }
        format.json { render json: @friends_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends_apps/1
  # DELETE /friends_apps/1.json
  def destroy
    @friends_app.destroy
    respond_to do |format|
      format.html { redirect_to friends_apps_url, notice: 'Friends app was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def correct_user 
    @friends_app = current_user.friends_apps.find_by(id: params[:id])
    redirect_to friends_apps_path, notice: "Not Authorized User" if @friends_apps.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friends_app
      @friends_app = FriendsApp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friends_app_params
      params.require(:friends_app).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
    end
end
