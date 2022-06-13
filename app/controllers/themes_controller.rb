class ThemesController < ApplicationController
  def index
    themes = Theme.all
    render json: { themes: themes }
  end
end
