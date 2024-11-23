class Session < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :participations, dependent: :destroy
    has_many :users, through: :participations
    has_many :transcripts

    before_create :generate_unique_code

    private

    def generate_unique_code
        self.code ||= loop do
            random_code = SecureRandom.random_number(10**6).to_s.rjust(6, '0')
            break random_code unless Session.exists?(code: random_code)
        end
    end
end
