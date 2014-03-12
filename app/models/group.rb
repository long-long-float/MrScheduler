class Group < ActiveRecord::Base
  has_many :user_and_groups
  has_many :users, through: :user_and_groups

  has_many :tasks

  acts_as_taggable
end
