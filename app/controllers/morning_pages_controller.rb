class MorningPagesController < ApplicationController
  before_action :authenticate_user!

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

  def update
    morning_page = current_user.morning_pages.find(params[:id])
    morning_page.update!(morning_page_params)
    render json: { morning_page: morning_page, message: "#{morning_page.title} has been updated" }
  end

  def destroy
    title = current_user.morning_pages.find(params[:id]).title
    current_user.morning_pages.find(params[:id]).delete
    render json: { morning_page: { title: title } }
  end

  private

  def morning_page_params
    params.require(:morning_page).permit(:title, :body).merge(user_id: current_user.id, theme_id: params[:theme_id])
  end
end
