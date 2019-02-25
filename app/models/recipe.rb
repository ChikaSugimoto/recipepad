class Recipe < ApplicationRecord
    
    validates :user_id, presence: true
    # validates :name, presence: true
    # validates :main_image, presence: true
    # validates :ingredient, presence: true
    # validates :description, presence: true

    mount_uploader :image, ImageUploader
    mount_uploader :main_image, ImageUploader

    belongs_to :user
    has_many :directions
    has_many :favorites
    has_many :favorite_users, through: :favorites, source: 'user'

end


