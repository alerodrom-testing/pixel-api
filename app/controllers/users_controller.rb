class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login, :create, :update, :destroy]
	before_action :set_user, only: [:show, :update, :destroy]
	
  def index 
    @users = User.all 
    render json: @users 
  end

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    else
      render json: { error: 'Invalid username or password' }
    end
	end
	
	# UPDATE
	def update
		if @user.update(user_params) 
      render json: { success: true } 
    else 
      render json: { success: false } 
    end 
	end 
	
	# SHOW
  def show 
    render json: @user
	end 
	
	# DESTROY
  def destroy 
    if @user.destroy 
      render json: { success: true } 
    else 
      render json: { success: false } 
    end 
  end 

  # LOGGING IN
  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    else
      render json: { error: 'Invalid username or password' }
    end
  end

  def auto_login
    render json: @user
  end

  private

	# GET USER
	def set_user 
    @user = User.find(params[:id]) 
  end 

  def user_params
    params.permit(:username, :password, :age)
  end
end
