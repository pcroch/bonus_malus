class Api::V1::ScoresController < Api::V1::BaseController


  def index
    @sinister = params[:sinister]
    @years = params[:years]
    @pro = params[:pro]


 if @years.nil? || @sinister.nil? || @pro.nil?
    render json: { Bonus_Malus_Score: "Empty or missing argument in querry string", status: :error }
  else
    @sinister = @sinister[0].to_i
    @years = @years[0].to_i
    @pro = @pro[0]
    render json: { Bonus_Malus_Score: computation, status: :success }
  end
end
  private
# def check_params
#       if params[:years].nil? || params[:sinister].nil? || params[:pro].nil?
#   response = { "error" => "bad nill" }
#   render json: response, status: :bad_request
# end

#     if params[:years].blank? || params[:sinister].blank? || params[:pro].blank?
#   response = { "error" => "bad client uuid" }
#   render json: response, status: :bad_request

# end

# end



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
end



#      p "hello"

# p  @sinister.nil?

#    p "bye bye"
