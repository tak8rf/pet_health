class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :invitable, :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :groups, dependent: :destroy
  has_many :families, through: :groups, source: :family
  attr_accessor :family_id
end
