class Meal < ApplicationRecord
    attachment :image
    belongs_to :customer, optional: true
end
