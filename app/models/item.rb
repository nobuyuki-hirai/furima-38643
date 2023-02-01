class Item < ApplicationRecord
  validates :title,            presence: true
  validates :price,            presence: true
  validates :concept,          presence: true
  validates :category_id,      presence: true
  validates :condition_id,     presence: true
  validates :postage_payer_id, presence: true
  validates :ship_area_id,     presence: true
  validates :ship_date_id,     presence: true

  belongs_to :user
end
