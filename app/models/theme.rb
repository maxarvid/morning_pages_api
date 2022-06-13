class Theme < ApplicationRecord
  validates_presence_of :name
  has_many :morning_pages
end
