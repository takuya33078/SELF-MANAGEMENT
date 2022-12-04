class Meal < ApplicationRecord
    belongs_to :customer, optional: true
end
