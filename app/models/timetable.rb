class Timetable < ActiveRecord::Base
  belongs_to :group

  has_many :class_changes
  has_many :subjects

  has_paper_trail

  validates :group, presence: true
  validates :author, presence: true, if: -> { User.find_by(id: author) }
  validates :data, presence: true

  def real_data
    JSON.parse(self.data).map do |row|
      row.map do |id|
        Subject.find_by(id: id).try do |s|
          s.attributes.slice('id', 'name', 'color')
        end
      end
    end.to_json
  end
end
