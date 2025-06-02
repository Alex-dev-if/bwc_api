class CopiesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_copy, only: %i[ update update destroy ]

  def index
    @copies = Copy.joins(:book)
    @copies = @copies.where(status: params[:status]) if params[:status].present?

    render json: @copies
  end

  # POST /copies or /copies.json
  def create
    copy = Copy.new(copy_params)
    
    if copy.save
      render json: { message: 'Copy created successfully', copy: }, status: :created
    else
      render json: { errors: copy.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /copies/1 or /copies/1.json
  def update
    @copy.status = "available"
    
    if @copy.update(copy_params)
      render json: { message: 'Copy updated successfully', copy: @copy }, status: :ok
    else
      render json: { errors: @copy.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /copies/1 or /copies/1.json
  def destroy
    if @copy.destroy
      render json: { message: 'Copy destroyed successfully', copy: @copy }, status: :ok
    else
      render json: { errors: @copy.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_copy
      @copy = Copy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def copy_params
      params.require(:copy).permit(:book_id, :status)
    end
end
