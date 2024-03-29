class Group < ActiveRecord::Base
  has_many :user_and_groups
  has_many :users, through: :user_and_groups

  has_many :tasks

  has_one :timetable

  acts_as_taggable

  before_save do
    users << User.find(owner) unless user_ids.include? owner

    unless timetable
      create_timetable(author: owner,
        #9 x 5 empty timetable
        data: 9.times.map{[''] * 5}.to_json)
    end
  end

  validates :name, presence: true, length: { maximum: 50 }
  validates :quiz, presence: true, length: { maximum: 200 }
  validates :answer, presence: true, length: { maximum: 200 }
  validates :owner, presence: true, if: ->{ User.find_by(id: owner) }
end
