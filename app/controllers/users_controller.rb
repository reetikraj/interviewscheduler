class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def edit
  end

  def show
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		render :show
  	else
  		render :new
  	end
  end

  def update 
  	if @user.update
  		render :show
  	else
  		render :edit
  	end
  end

  def destroy
  	@user.destroy
  end

  private
  def set_user
  	@user = User.find(params[:id])
  end

  def user_params
  	params.require(:user).permit(:name, :email, :resume)
  end
  
end
