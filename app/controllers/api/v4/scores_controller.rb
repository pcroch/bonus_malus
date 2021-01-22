require 'pry'

class Api::V4::ScoresController < Api::V4::BaseController
  def index
    # creating a hash
    @@params_hash = {}
    @@params_hash[:sinister] = params[:sinister]
    @@params_hash[:years] = params[:years]
    @@params_hash[:pro] = params[:pro]


    error_handeler
  end

private

  def error_handeler

    if  @@params_hash.any? { |_key, value| value.nil? }
     render_errors_missing_params
    elsif  @@params_hash.any? { |_key, value|  value.first.match?(/\D/) }
      render_errors_char_string
    elsif @@params_hash.any? { |_key, value|  value.first.length.zero? }
      render_errors_missing_value
    elsif @@params_hash[:sinister].first.to_i > 2
      render_errors_min_max
    elsif @@params_hash[:pro].first.to_i > 1
      render_errors_boolean
    else
      @@params_hash[:sinister] = @@params_hash[:sinister].first.to_i
      @@params_hash[:years] = @@params_hash[:years].first.to_i
      @@params_hash[:pro] = @@params_hash[:pro].first.to_i
      render json: { Bonus_Malus_Score: computation, status: :success }
    end
  end

  def professional
    if @@params_hash[:pro] == 1
      3
    elsif @@params_hash[:pro].zero?
      0
    end
  end

  def computation
    bonus_array = [11, 16, 21]
    score = bonus_array[@@params_hash[:sinister]] + professional - @@params_hash[:years]
    score > -2 ? score : -2
  end

end
