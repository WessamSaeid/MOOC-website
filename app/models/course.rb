class Course < ApplicationRecord
    validates :title, presence: true, length: { minimum: 2 }

    has_many :lectures
    belongs_to :user
end
