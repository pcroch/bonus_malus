

class Api::V3::ScoresController < Api::V3::BaseController
  def index
    @sin = params[:sinister]
    @yrs = params[:years]
    @pr = params[:pro]

    newa = Api::V3::BaseController.new({:sinister=>@sin,  :years=>@yrs , :pro=>@pr})
    newa.error_handeler

 render json: { Bonus_Malus_Score: $aa}
  end






end




