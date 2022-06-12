class MorningPagesController < ApplicationController
  def index
    pages = MorningPage.all
    render json: { morning_pages: pages }
  end
end
