class User < ActiveRecord::Base

  has_many :contacts
  has_many :messages

  validates :name, :presence => true
  validates :number, :presence => true

  validates_uniqueness_of :number
  validates_uniqueness_of :email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
