class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: %i[ update destroy ]

  def index
    @users = User.all
    render json: @users
  end

  def update
    if @user.update(user_params)
      render json: { message: 'User updated successfully', user: @user }, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: { message: 'User created successfully', user: user }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!
    
    respond_to do |format|
      format.json { head :no_content }
    end
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end
