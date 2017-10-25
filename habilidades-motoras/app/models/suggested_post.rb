class SuggestedPost < ActiveRecord::Base
  has many :publications, dependet: :destroy

  validates :form_id, uniqueness: true, presence: true, numericality: true
  validates :publication_id, uniqueness: true, presence: true, numericality: true
end
