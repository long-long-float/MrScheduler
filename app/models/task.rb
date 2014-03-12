class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  has_many :comments

  acts_as_taggable
end
