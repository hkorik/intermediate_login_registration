class Comment < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :receiver_id

  validates :content, presence: true
end
