class Progress < ActiveRecord::Base
    validates :User_id, uniqueness: true, presence: true, numericality: true
    validates :Publication_id, uniqueness: true, presence: true, numericality: true
end
