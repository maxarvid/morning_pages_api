class AddThemeIdToMorningPage < ActiveRecord::Migration[7.0]
  def change
    add_reference :morning_pages, :theme, foreign_key: true
  end
end
