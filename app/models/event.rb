class Event < ActiveRecord::Base

	belongs_to :user
	belongs_to :society
	has_many :comments, dependent: :destroy
	has_many :tickets, dependent: :destroy
	has_many :annoucements, dependent: :destroy
    validates :society, presence: true
    validates :title, presence: true, length: { maximum: 255 }
    validates :location_address, length: { maximum: 255 }
    has_attached_file :banner, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/
     has_attached_file :picture1, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :picture1, :content_type => /\Aimage\/.*\Z/
     has_attached_file :picture2, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :picture2, :content_type => /\Aimage\/.*\Z/
     has_attached_file :picture3, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :picture3, :content_type => /\Aimage\/.*\Z/

    
    

    
end
