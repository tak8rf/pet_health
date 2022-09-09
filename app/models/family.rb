class Family < ApplicationRecord
    validates :name, presence: true
    has_many :groups, dependent: :destroy
    has_many :users, through: :groups, source: :user
    has_many :pets
end
