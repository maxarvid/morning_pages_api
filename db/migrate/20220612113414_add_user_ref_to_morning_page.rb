class AddUserRefToMorningPage < ActiveRecord::Migration[7.0]
  def change
    add_reference :morning_pages, :user, foreign_key: true
  end
end
