class User < ActiveRecord::Base
  belongs_to :group

  has_many :comments
  has_many :tasks
end
