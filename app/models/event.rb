class Event < ApplicationRecord
  validates :title, :date, presence: true
  has_many :event_attendances, foreign_key: :attended_event
  has_many :attendees, through: :event_attendances
  belongs_to :creator, class_name: "User"
  scope :upcoming, -> { where(Date.today > :date) }
  scope :past, -> { where(Date.today < :date) }
end
