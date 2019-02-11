class Report < ApplicationRecord
    
    validates :recipe_id, presence: true
    validates :comment, presence: true
end
