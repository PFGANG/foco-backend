class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    
    has_many :participations, dependent: :destroy
    has_many :sessions, through: :participations
end
