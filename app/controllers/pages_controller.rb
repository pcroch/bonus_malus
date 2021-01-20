class PagesController < ApplicationController


  def home
    render json: { Bonus_Malus_Score: "This is an api please refer to https://github.com/pcroch/bonus_malus for the documentation", status: :error }

  end
end
