class Image < ActiveRecord::Base
  belongs to :publication
  
  validates :image_id, uniqueness: true, presence: true, :numericality => {greater_than_or_equal_to: 1}
  validates :path, length:{maximun:150}, presence: true
end
