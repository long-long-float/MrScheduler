class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  has_many :comments

  acts_as_taggable

  has_paper_trail

  validates :group, presence: true
  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, length: { maximum: 200 }
  validates :deadline, presence: true
end
