class BiasesController < ApplicationController
  def index
    @biases = Bias.all
    render json: @biases
  end
end
