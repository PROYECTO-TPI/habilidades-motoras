class Progress < ActiveRecord::Base
  belongs to :publication
  belongs to :user
  
  validates :User_id, uniqueness: true, presence: true, numericality: true
  validates :Publication_id, uniqueness: true, presence: true, numericality: true
end
