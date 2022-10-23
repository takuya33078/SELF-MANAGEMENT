class Weight < ApplicationRecord
    belongs_to :customer, optional: true
end
