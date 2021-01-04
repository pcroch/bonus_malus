class Api::V1::ScoresController < Api::V1::BaseController

  # def initialize
  #   @sinister = nil
  #   @years = nil
  #   @pro = nil
  # end

  def index

     p "hello"

 p params[:years]

       p "bye bye"

 unless @years.nil? || @sinister.nil? || @pro.nil?
    @sinister = params[:sinister][0].to_i
    @years = params[:years][0].to_i
    @pro = params[:pro][0]
    render json: { Bonus_Malus_Score: computation, status: :success }
  else
    render json: { Bonus_Malus_Score: "Missing number of argements or values in querry string", status: :error }
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


