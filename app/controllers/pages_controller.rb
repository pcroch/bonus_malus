class PagesController < ApplicationController


  def home
    render json: { Bonus_Malus_Score: "This is an api please read refer to documentation in https://github.com/pcroch/bonus_malus ", status: :error }

  end
end
