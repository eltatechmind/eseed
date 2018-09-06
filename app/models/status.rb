class Status < ApplicationRecord
	has_many :attendances, dependent: :destroy
	validates :statu,  presence: true, length: { minimum: 5, maximum: 50 }
	def to_s
     self.statu
  	end
end
