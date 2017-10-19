class Tip < ActiveRecord::Base
    validates :tip_id, presence: true, numericality: true, uniqueness: true
    validates :description, length:{maximun:500}
end
