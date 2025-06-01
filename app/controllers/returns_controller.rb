class ReturnsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    ActiveRecord::Base.transaction do
      @landing = Landing.includes(:copy).find(params[:landing_id])
      
      unless @landing.copy
        return render json: { error: 'Associated copy not found' }, status: :unprocessable_entity
      end

      if @landing.status == 'returned'
        return render json: { error: 'This book has already been returned' }, status: :conflict
      end

      @landing.update!(
        return_date: Time.current,
        status: 'returned'
      )

      @landing.copy.update!(
        status: 'available'
      )

      render json: { 
        message: 'Return successful',
        landing: {
          id: @landing.id,
          status: @landing.status,
          return_date: @landing.return_date
        },
        copy: {
          id: @landing.copy.id,
          code: @landing.copy.code,
          status: @landing.copy.status
        }
      }, status: :ok
    end
    
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Loan not found' }, status: :not_found
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end