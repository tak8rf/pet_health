class Pet < ApplicationRecord
  belongs_to :family
  mount_uploader :image, ImageUploader
end
