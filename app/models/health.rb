class Health < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  def self.search(keyword)
    where(["title like? OR content like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
