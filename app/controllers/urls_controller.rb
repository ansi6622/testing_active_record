class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    @url = Url.create(url_params)

    if @url.valid?
      redirect_to url_path(@url)
    else
      render :show
    end

  end

  def show
    @url = Url.find(params[:id])
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end
end