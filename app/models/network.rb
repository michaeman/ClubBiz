class Network < ActiveRecord::Base
	
    belongs_to :society
	validates :name, presence: true, uniqueness:true, length: { maximum: 255 }
	
end
