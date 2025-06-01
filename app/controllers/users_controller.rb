class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @users = User.all
    render json: @users
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
    @users = User.find(params[:id])
    @users.destroy!
    
    respond_to do |format|
      format.json { head :no_content }
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end
