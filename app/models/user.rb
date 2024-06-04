class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates_presence_of :first_name
         validates_presence_of :last_name
         validates :mobile_number,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }
                 has_many :posts
                 has_many :likes, dependent: :destroy
                 has_one_attached :image
end
