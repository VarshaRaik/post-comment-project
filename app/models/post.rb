class Post < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :comments
    belongs_to :user, :optional => true
    validates :title, :body, presence: true 
    has_one_attached :image

end
