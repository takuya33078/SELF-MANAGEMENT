class Meal < ApplicationRecord
    #attachment :image
    mount_uploader :image, ImageUploader
    belongs_to :customer, optional: true
end
