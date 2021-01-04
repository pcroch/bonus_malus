class Api::V2::ScoresController < Api::V2::BaseController
  def index
    @sinister = params[:sinister]
    @years = params[:years]
    @pro = params[:pro]
    no_string
  end



# for debugging only
     p "hello"

p  @years

   p "bye bye"



  private

  def no_string
    if @years.nil? || @sinister.nil? || @pro.nil?
      render_errors_missing_params
    else
      no_value
      # for degugging only
      # render json: { Bonus_Malus_Score: "computation_string", status: :success }
    end
  end

  def no_value
    if @years.first.empty? || @sinister.first.empty? || @pro.first.empty?
      render_errors_missing_value
    else
      min_max_value
      # for degugging only
      # render json: { Bonus_Malus_Score: "computation_value", status: :success }
    end
  end

  def min_max_value
    if @sinister.first.to_i > 2
      render_errors_min_max
    else
      boolean

      # for degugging only
      # render json: { Bonus_Malus_Score: "computation_min_max", status: :success }

    end
  end


  def boolean
    if @pro.first.to_i > 1
      render_errors_boolean
    else
      @sinister = @sinister.first.to_i
      @years = @years.first.to_i
      @pro = @pro.first.to_i
      render json: { Bonus_Malus_Score: computation, status: :success }
      # for degugging only
      # render json: { Bonus_Malus_Score: "computation_", status: :success }

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
    # for debuggin only ( add return to above line if in use)
    # p score
  end
end

# for debugging only
#      p "hello"

# p  @sinister.nil?

#    p "bye bye"



