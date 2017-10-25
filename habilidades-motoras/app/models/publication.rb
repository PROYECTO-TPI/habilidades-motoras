class Publication < ActiveRecord::Base
  has many :progress, dependent: :destroy
  has many :images
  has many :videos

  validates :rol, :numericality => {greater_than_or_equal_to: 1}, presence:true
  validates :title, length:{minimun:0, maximun:40}
  validates :type, length:{minimun:0, maximun:30}
  validates :description, length:{minimun:0, maximun:500}
end
