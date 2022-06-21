class MorningPagesController < ApplicationController
  before_action :authenticate_user!, only: %i[index show create]

  def index
    pages = current_user.morning_pages
    render json: { morning_pages: pages }
  end

  def show
    morning_page = current_user.morning_pages.find(params[:id])
    render json: { morning_page: morning_page }
  end

  def create
    morning_page = MorningPage.create!(morning_page_params)
    render json: { morning_page: morning_page, message: 'The page was saved to the database' }, status: 201
  end

  private

  def morning_page_params
    params.require(:morning_page).permit(:title, :body).merge(user_id: current_user.id, theme_id: params[:theme_id])
  end
end
