class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_and_groups
  has_many :groups, through: :user_and_groups

  has_many :comments
  has_many :tasks

  has_many :notifications

  validates :name, presence: true, length: { maximum: 20 }
  validates :title, presence: true, length: { maximum: 20 }
end
