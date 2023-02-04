class Item < ApplicationRecord
  validates :title,            presence: true
  validates :price,            presence: true
  validates :concept,          presence: true
  validates :category_id,      presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :condition_id,     presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :postage_payer_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :ship_area_id,     presence: true
  validates :ship_date_id,     presence: true

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_payer
end
