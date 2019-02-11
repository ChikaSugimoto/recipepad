class Recipe < ApplicationRecord
    
    validates :user_id, presence: true
    validates :name, presence: true
    validates :main_image, presence: true
    validates :ingredient, presence: true
    validates :description, presence: true

    belongs_to :user

    has_many :favorites

    mount_uploader :main_image, ImageUploader
end


