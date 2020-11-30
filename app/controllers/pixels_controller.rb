class PixelsController < ApplicationController
  before_action :authorized
	before_action :set_pixel, only: [:show, :update, :destroy]
	
	def index
		debugger
    @pixels = Pixel.where(params[:user_id])
    render json: @pixels 
  end

  # REGISTER
  def create
		@pixel = Pixel.create(pixel_params)
    if @pixel.valid?
      render json: { pixel: @pixel }
    else
      render json: { error: 'Invalid pixel' }
    end
	end
	
	# UPDATE
	def update
		if @pixel.update(pixel_params) 
      render json: { success: true } 
    else 
      render json: { success: false } 
    end 
	end 
	
	# SHOW
  def show 
    render json: @pixel
	end 
	
	# DESTROY
  def destroy 
    if @pixel.destroy 
      render json: { success: true } 
    else 
      render json: { success: false } 
    end 
  end 

  private

	# GET pixel
	def set_pixel
		debugger
    @pixel = Pixel.find(params[:user_id], params[:id]) 
  end 

  def pixel_params
    params.permit(:user_id, :pixel, :axis_x, :axis_y)
  end
end
