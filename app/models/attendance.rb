class Attendance < ApplicationRecord
	belongs_to :employee
	belongs_to :status
	validates :day, presence: true, inclusion: { in: (Time.current-30.years..Time.current) } 
	validates :whours,  presence: true, length: { minimum: 0, maximum: 16 }  
	 validate :whours_wrong
	def whours_wrong
	  self.errors.add(:base, 'cant work when he is absent or day off') if (self.status_id == 2 && self.whours !=0) || (self.status_id == 4 && self.whours !=0)
	end
end
