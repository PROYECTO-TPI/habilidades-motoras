class SuggestedPost < ActiveRecord::Base
    validates :form_id, uniqueness: true, presence: true, numericality: true
    validates :publication_id, uniqueness: true, presence: true, numericality: true
end
