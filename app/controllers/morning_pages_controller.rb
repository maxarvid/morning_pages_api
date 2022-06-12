class MorningPagesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    pages = MorningPage.all
    render json: { morning_pages: pages }
  end
end
