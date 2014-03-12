class Group < ActiveRecord::Base
  has_many :users
  has_many :tasks

  acts_as_taggable
end
