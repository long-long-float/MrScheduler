class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  has_many :comments

  acts_as_taggable

  validates :group, presence: true
  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, length: { maximum: 500 }
  validates :deadline, presence: true
end
