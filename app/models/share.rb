class Share < ActiveRecord::Base
  has_and_belongs_to_many :user
  belongs_to :receiver, :class_name => "User"
  belongs_to :clip
end
