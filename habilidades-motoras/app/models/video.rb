class Video < ActiveRecord::Base
  belongs to :publication
  
  validates :video_id, uniqueness: true, presence: true, :numericality => {greater_than_or_equal_to: 1}
  validates :url, length:{maximun:150}, presence: true
end
