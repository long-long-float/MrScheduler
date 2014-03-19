class ClassChange < ActiveRecord::Base
  belongs_to :timetable

  validates :timetable, presence: true
  validates :date1, presence: true
  validates :index1, presence: true, numericality: { greater_than: 0 }
  validates :date2, presence: true
  validates :index2, presence: true, numericality: { greater_than: 0 }
  validate :classes_must_be_diffirent#, :subject_must_be_exist

  before_save do
    if date1 > date2
      self.date2, self.date1 = self.date1, self.date2
      self.index2, self.index1 = self.index1, self.index2
    end
  end

  private

  def classes_must_be_diffirent
    errors.add(:date1, '同一の授業は指定できません') if date1 == date2 and index1 == index2
  end

  def subject_must_be_exist
    if self.index2
      timetable_data = JSON.parse(self.timetable.data)
      subject1 = Subject.find_by(id: timetable_data[self.index1 - 1][self.date1.wday - 1])
      subject2 = Subject.find_by(id: timetable_data[self.index2 - 1][self.date2.wday - 1])
      errors.add(:date1, '正しい授業を指定してください') unless subject1 and subject2
    end
  end
end
