class Session < ApplicationRecord
    has_many :participations, dependent: :destroy
    has_many :users, through: :participations
    has_many :transcripts
end
