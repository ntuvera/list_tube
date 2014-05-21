class Share < ActiveRecord::Base
  belongs_to :users
  belongs_to :receiver, :class_name => "User"
  belongs_to :clip
  has_many :shares
end
