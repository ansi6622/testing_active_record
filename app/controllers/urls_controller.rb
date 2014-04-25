class UrlsController < ApplicationController
  def index
    @urls = Url.active
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.create(url_params)

    if @url.valid?
      redirect_to urls_path
    else
      render :new
    end

  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end
end