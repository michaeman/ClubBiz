class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events
  has_many :societies
  has_many :comments
  has_many :tickets
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :phone_number, presence: true, length: {is: 10}
   
  VALID_ID = [123456,121212,232323,343434,454545,565656,654321,909090]
  validates :student_id, :inclusion => { :in => VALID_ID, 
    message: " ID %{value} is not a valid ID" }, presence: true, length: {is: 6}, uniqueness:true

  def user_info
  	"#{self[:first_name]} #{self[:last_name]} #{self[:student_id]}"
  end

  def full_name
  	"#{self[:first_name]} #{self[:last_name]}"
  end

end
