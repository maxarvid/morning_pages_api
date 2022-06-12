class MorningPage < ApplicationRecord
  validates_presence_of :body
  belongs_to :user
end
