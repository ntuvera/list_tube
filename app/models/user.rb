class User < ActiveRecord::Base
  has_secure_password
  has_many :shares

  # the next two lines don't work. They will lead to only clips through shares
  # working.
  has_and_belongs_to_many :clips, through: :clips_users
  has_and_belongs_to_many :clips, through: :shares
  validates :name, presence: true, uniqueness: {message: "user name already exists"}
  validates :password, :length => {:within => 6..8, :wrong_length => "please input password between 8-12 characters"}
end
