class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable 
  belongs_to :group

  has_many :comments
  has_many :tasks

  def self.find_for_twitter_oauth(auth)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name: auth.info.nickname, provider: auth.provider, uid: auth.uid, password:Devise.friendly_token[0,20])
    end
    user
  end
end