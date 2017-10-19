class User < ActiveRecord::Base
    validates :name, length:{minimun:3, maximun:60}, presence: true
    validates :age, :numericality => {greater_than_or_equal_to: 1}, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length:{minimun:5, maximun:20}
end
