class Society < ActiveRecord::Base
	belongs_to :user
	has_one  :report
	has_many :comments, dependent: :destroy
	has_many :follows, dependent: :destroy
	has_many :networks
	has_many :events
	has_many :admins
	has_many :annoucements, dependent: :destroy
	has_many :invitations
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
    :default_url => "/images/:style/missing.png"
	validates :name, presence: true, uniqueness:true, length: { maximum: 255 }
	validates :description, presence: true
	VALID_CODES = [111111,222222,333333,444444,555555,666666,777777,888888,999999]
	validates :validation_code, :inclusion => { :in => VALID_CODES, 
    message: "%{value} is not valid"}, presence: true,length: {is: 6}, uniqueness:true

    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	
end
