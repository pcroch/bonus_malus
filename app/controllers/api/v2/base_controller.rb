class Api::V2::BaseController < ActionController::API
  # before_action :ensure_json_request

  private

  # def ensure_json_request
  #   return if request.format == :json
  #   request.format.symbol == :json
  #   render_errors([{ code: '1', message: 'Requests need to be in JSON format.'}], :not_acceptable)#406
  # end

  def render_errors(errors = [], status = :ok)
    render json: { errors: errors }, status: status
  end

  def render_errors_layout
    render_errors([{ code: '1', message: 'Incorrect layout.' }], :not_acceptable)
  end

  def render_errors_missing_params
    render_errors([{ code: '2', message: 'Missing params' }], :not_acceptable)
  end

  def render_errors_missing_value
    render_errors([{ code: '3', message: 'Missing value(s)' }], :not_acceptable)
  end

  def render_errors_min_max
    render_errors([{ code: '4', message: 'Please contact the helpdesk if sinister greater than 2' }], :not_acceptable)
  end

   def render_errors_boolean
    render_errors([{ code: '5', message: 'Pro params should be 0 or 1' }], :not_acceptable)
  end
end
