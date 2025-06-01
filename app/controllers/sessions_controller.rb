class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      render json: {
        message: 'Login successful',
        user: {
          id: user.id,
          name: user.name,
          email: user.email
          role: user.role
        }
        user:
      }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def destroy
    render json: { message: 'Logged out successfully' }, status: :ok
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end