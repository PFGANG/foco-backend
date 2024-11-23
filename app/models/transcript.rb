class Transcript < ApplicationRecord
  belongs_to :session
  validates :content, presence: true
end
