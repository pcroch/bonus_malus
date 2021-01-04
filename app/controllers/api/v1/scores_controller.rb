class Api::V1::ScoresController < Api::V1::BaseController

  def index

     p "hello"
     # p
 p params[:sinister].present?
    # p permitted.to_h.size
       p "bye bye"




    @sinister = params[:sinister][0].to_i
    @years = params[:years][0].to_i
    @pro = params[:pro][0]

    render json: { Bonus_Malus_Score: computation, status: :success }
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
    # unless score
    #   render_errors([{ code: '3', message: 'Month not found' }], :not_found)
    # end
  end
end



# render_errors_layout
  # def product_params
  #   permitted = params.require(:test).permit(:sinister, :years, :pro)
  # end
