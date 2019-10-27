class Device < ApplicationRecord
	before_save{self.name = self.owner+"."+self.name}
	validates :name, presence: true {maximum: 100}, uniqueness: true{case_sensitive: false}
	validates :owner, presence: true {maximum: 100} 
end
