class LandingsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_landing, only: %i[ update destroy ]

  # POST /landings or /landings.json
  def create
    landing = Landing.new(landing_params)
    
    if landing.save
      render json: { message: 'Landing created successfully', landing: }, status: :created
    else
      render json: { errors: landing.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /landings/1 or /landings/1.json
  def update    
    if @landing.update(landing_params)
      render json: { message: 'Landing updated successfully', landing: @landing }, status: :ok
    else
      render json: { errors: @landing.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /landings/1 or /landings/1.json
  def destroy
    if @landing.destroy
      render json: { message: 'Landing destroyed successfully', landing: @landing }, status: :ok
    else
      render json: { errors: @landing.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landing
      @landing = Landing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def landing_params
      params.require(:landing).permit(:landing_date, :return_date, :user_id, :copy_id, :status)
    end
end
