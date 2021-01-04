# app/controllers/api/v1/base_controller.rb
class Api::V1::BaseController < ActionController::API
  before_action :ensure_json_request

  private

  def ensure_json_request
    return if request.format == :json
    request.format.symbol == :json
    render_errors([{ code: '1', message: 'Requests need to be in JSON format.'}], :not_acceptable)#406
  end

  def render_errors(errors=[], status=:ok)
    render json: { errors: errors }, status: status
  end

  def render_errors_layout
    render_errors([{ code: '2', message: 'Incorrect layout.'}], :not_acceptable)
  end
end
