class User < ApplicationRecord
    has_many :participations, dependent: :destroy
    has_many :sessions, through: :participations
    validates :email, presence: true, uniqueness: true
end
