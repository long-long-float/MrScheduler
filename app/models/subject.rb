class Subject < ActiveRecord::Base
  belongs_to :timetable

  enumerize :color, in: [:blue, :yellow, :green, :red, :purple, :pink]

  validates :timetable, presence: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :color, presence: true
end
