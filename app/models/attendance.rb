class Attendance < ApplicationRecord
	belongs_to :employee
	belongs_to :status
	validates :day, presence: true, inclusion: { in: (Time.current-30.years..Time.current) } 
	validates :whours,  presence: true, length: { minimum: 0, maximum: 16 }  
end
