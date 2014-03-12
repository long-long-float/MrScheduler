class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  validates :user, presence: true
  validates :task, presence: true
  validates :content, presence: true, length: { maximum: 500 }
end
