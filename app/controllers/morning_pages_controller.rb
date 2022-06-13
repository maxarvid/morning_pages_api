class MorningPagesController < ApplicationController
  before_action :authenticate_user!, only: %i[index show]
  def index
    pages = MorningPage.all
    render json: { morning_pages: pages }
  end

  def show
    morning_page = MorningPage.find(params[:id])
    render json: { morning_page: morning_page }
  end
end
