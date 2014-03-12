class Timetable < ActiveRecord::Base
  belongs_to :group

  validates :group, presence: true
  validates :author, presence: true, if: -> { User.find_by(id: author) }
  validates :data, presence: true
end
