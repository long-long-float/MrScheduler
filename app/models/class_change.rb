class ClassChange < ActiveRecord::Base
  belongs_to :timetable

  validates :timetable, presence: true
  validates :date1, presence: true
  validates :index1, presence: true, numericality: { greater_than: 0 }
  validates :date2, presence: true
  validates :index2, presence: true, numericality: { greater_than: 0 }
  validate :same_class_check

  before_save do
    if date1 > date2
      self.date2, self.date1 = self.date1, self.date2
      self.index2, self.index1 = self.index1, self.index2
    end
  end

  private

  def same_class_check
    errors.add(:date1, '同一の授業は指定できません') if date1 == date2 and index1 == index2
  end
end
