class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :subscription

  validates :email, :first_name, :last_name ,presence: true
  validates :email,uniqueness: true
  validates_presence_of :password, :on => :create

end
