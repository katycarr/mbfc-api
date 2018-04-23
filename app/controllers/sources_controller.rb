class SourcesController < ApplicationController
  def index
    @sources = Source.all
    render json: @sources
  end

  def show
    @source = Source.find(params[:id])
    if @source
      render json: @source
    else
      render json: {error: 'Not found'}
    end
  end
end
