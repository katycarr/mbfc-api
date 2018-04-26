class BiasesController < ApplicationController
  def index
    @biases = Bias.all
    render json: @biases
  end

  def show
    @bias = Bias.find(params[:id])
    if @bias
      render json: @bias
    else
      render json: {error: 'Not found'}
    end
  end
end
