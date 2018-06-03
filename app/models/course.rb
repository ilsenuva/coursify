class Course < ApplicationRecord
	validates :name, presence: true
	has_many :materials, dependent: :delete_all
end
