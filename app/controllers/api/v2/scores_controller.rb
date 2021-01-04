class Api::V2::ScoresController < Api::V2::BaseController
  def index
    @sinister = params[:sinister]
    @years = params[:years]
    @pro = params[:pro]

    error_handeler
  end

  private

  def error_handeler
    if @years.nil? || @sinister.nil? || @pro.nil?
      render_errors_missing_params
    elsif @years.first.match?(/\D/) || @sinister.first.match?(/\D/) || @pro.first.match?(/\D/)
      render_errors_char_string
    elsif @years.first.empty? || @sinister.first.empty? || @pro.first.empty?
      render_errors_missing_value
    elsif @sinister.first.to_i > 2
      render_errors_min_max
    elsif @pro.first.to_i > 1
      render_errors_boolean
    else
      @sinister = @sinister.first.to_i
      @years = @years.first.to_i
      @pro = @pro.first.to_i
      render json: { Bonus_Malus_Score: computation, status: :success }
    end
  end

  def professional
    if @pro == 1
      3
    elsif @pro == 0
      0
    end
  end

  def computation
    bonus_array = [11, 16, 21]
    score = bonus_array[@sinister] + professional - @years
    score > -2 ? score : -2
  end
end

# for debugging only
#      p "hello"
# regex = /\D/
# p   @sinister.first.class
# p   @sinister

# p  @sinister.first =~ /\D/

#    p "bye bye"


# for debugging only
  # render json: { Bonus_Malus_Score: "computation_string", status: :success }
