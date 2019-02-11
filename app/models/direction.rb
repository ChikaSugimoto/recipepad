class Direction < ApplicationRecord
    validates :recipe_id, presence: true
end
