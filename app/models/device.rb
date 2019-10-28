class Device < ApplicationRecord
	before_save{self.name = self.owner+"."+self.name}
	
	validates :name, 
	presence: true, 
	length: {maximum: 100}, 
	uniqueness: {case_sensitive: false}
	
	validates :owner, 
	presence: true, 
	length: {maximum: 100} 
end
