class FinesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_fine, only: %i[ update update destroy ]

  def by_user
    user = User.find_by(id: params[:user_id])
    
    if user
      fines = user.fines
      render json: fines
    else
      render json: { error: 'Usuário não encontrado' }, status: :not_found
    end
  end

  # POST /fines or /fines.json
  def create
    fine = Fine.new(fine_params)
    fine.status = "pending"

    if fine.save
      render json: { message: 'Fine created successfully', fine: }, status: :created
    else
      render json: { errors: fine.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fines/1 or /fines/1.json
  def update
    @fine.status = "available"
    
    if @fine.update(fine_params)
      render json: { message: 'Fine updated successfully', fine: @fine }, status: :ok
    else
      render json: { errors: @fine.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /fines/1 or /fines/1.json
  def destroy
    if @fine.destroy
      render json: { message: 'Fine destroyed successfully', fine: @fine }, status: :ok
    else
      render json: { errors: @fine.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fine
      @fine = Fine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fine_params
      params.require(:fine).permit(:value, :status, :user_id, :landing_id)
    end
end
