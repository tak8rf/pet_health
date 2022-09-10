class Pet < ApplicationRecord
  belongs_to :family

  has_many :tasks
  mount_uploader :image, ImageUploader
end
