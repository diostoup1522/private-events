class Event < ApplicationRecord
  validates :title, :date, presence: true
  belongs_to :creator, class_name: "User"
end
