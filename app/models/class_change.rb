class ClassChange < ActiveRecord::Base
  belongs_to :timetable

  validates :timetable, presence: true
  validates :date1, presence: true
  validates :index1, presence: true, numericality: { greater_than: 0 }
  validates :date2, presence: true
  validates :index2, presence: true, numericality: { greater_than: 0 }
  validate do
    errors.add(:date1, '同一の授業は指定できません') if date1 == date2 and index1 == index2
  end
end
