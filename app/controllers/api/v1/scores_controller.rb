class Api::V1::ScoresController < Api::V1::BaseController


  def index
    @sinister = params[:sinister]
    @years = params[:years]
    @pro = params[:pro]
    no_string

     p "hello"

# p  @sinister.first.to_i

   p "bye bye"




  end
  private

  def no_string
     if @years.nil? || @sinister.nil? || @pro.nil?
      render_errors_missing_params
    else
no_value
       # render json: { Bonus_Malus_Score: "computation_string", status: :success }
    end
  end

  def no_value

     if @years.first.empty? || @sinister.first.empty?
      render_errors_missing_value
    else
      min_max_value
      # render json: { Bonus_Malus_Score: "computation_value", status: :success }
      # @sinister = @sinister.first.to_i
      # @years = @years.first.to_i
      # @pro = @pro.first
      # render json: { Bonus_Malus_Score: computation, status: :success }
    end
  end

  def min_max_value
    if @sinister.first.to_i > 2
     # render json: { Bonus_Malus_Score: "comutation min max", status: :success }
      render_errors_min_max
    else
      @sinister = @sinister.first.to_i
      @years = @years.first.to_i
      @pro = @pro.first
      render json: { Bonus_Malus_Score: computation, status: :success }
      # min_max_value
       # render json: { Bonus_Malus_Score: "computation_min_max", status: :success }

    end
  end




  def professional(str)
    if @pro == 'true'
      3
    elsif @pro == 'false'
      0
    end
  end

  def computation
    bonus_array = [11, 16, 21]
    score = bonus_array[@sinister] + professional(@pro) - @years
    return score > -2 ? score : -2
    p score
  end


  def print_score

  end
end



#      p "hello"

# p  @sinister.nil?

#    p "bye bye"




