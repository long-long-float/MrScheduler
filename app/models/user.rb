class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
    :recoverable, :rememberable, :trackable, #:validatable,
    :omniauthable 
  belongs_to :group

  has_many :comments
  has_many :tasks

  def email_required?
    (provider.blank? || !email.blank?) && super
  end

  def self.find_for_twitter_oauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    unless user
      user = User.create(temporary_name: auth.info.nickname, provider: auth.provider, uid: auth.uid)
    end
    user
  end
end