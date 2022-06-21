class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response

  def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: 422
  end

  def render_record_not_found_response
    render json: { errors: ['Morning page not found'] }, status: 404
  end
end
