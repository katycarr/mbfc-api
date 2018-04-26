class SourcesController < ApplicationController
  include SourcesHelper
  def index
    if params[:q]
      @sources = search(params[:q])
    else
      @sources = Source.all
    end
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
