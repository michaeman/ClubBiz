class Comment < ActiveRecord::Base

  belongs_to :event
  belongs_to :society
  has_one :user
  
end
