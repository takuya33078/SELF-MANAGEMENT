class Weight < ApplicationRecord
    belongs_to :customer, optional: true
    validates :current_weight, numericality: { only_integer: true }
end
