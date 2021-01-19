class Api::V3::BaseController < ActionController::API


attr_accessor :sinister, :years, :pro

    def initialize(attributes = {})
      @sinister = attributes[:sinister]
      @years = attributes[:years]
      @pro = attributes[:pro]
    end




    def error_handeler
     # @sinister =  self.sinister
        @sinister = self.sinister.first.to_i
        @years = self.years.first.to_i
        @pro = self.pro.first.to_i
        #  #
          # binding.pry
      $aa = computation

    end


    # def error_handeler
    #   if @years.nil? || @sinister.nil? || @pro.nil?
    #     render_errors_missing_params
    #   elsif @years.first.match?(/\D/) || @sinister.first.match?(/\D/) || @pro.first.match?(/\D/)
    #     render_errors_char_string
    #   elsif @years.first.empty? || @sinister.first.empty? || @pro.first.empty?
    #     render_errors_missing_value
    #   elsif @sinister.first.to_i > 2
    #     render_errors_min_max
    #   elsif @pro.first.to_i > 1
    #     render_errors_boolean
    #   else
    #     @sinister = @sinister.first.to_i
    #     @years = @years.first.to_i
    #     @pro = @pro.first.to_i
    #     render json: { Bonus_Malus_Score: computation, status: :success }
    #   end
    # end

    # def professional
    #   if @pro == 1
    #     3
    #   elsif @pro == 0
    #     0
    #   end
    # end

    def computation


      bonus_array = [11, 16, 21]
      score = bonus_array[@sinister] + @pro - @years
      score > -2 ? score : -2
    end


  private

  # errors handeling
  def render_errors(errors = [], status = :ok)
    render json: { errors: errors }, status: status
  end

  def render_errors_missing_params
    render_errors([{ code: '1', message: 'Missing params' }], :not_acceptable)
  end

  def render_errors_char_string
    render_errors([{ code: '2', message: 'Number only.' }], :not_acceptable)
  end

  def render_errors_missing_value
    render_errors([{ code: '3', message: 'Missing value(s)' }], :not_acceptable)
  end

  def render_errors_min_max
    render_errors([{ code: '4', message: 'Please contact the helpdesk if sinister greater than 2' }], :not_acceptable)
  end

  def render_errors_boolean
    render_errors([{ code: '5', message: 'Pro params should be 0 or 1' }], :not_acceptable)
  end



end


