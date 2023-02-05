class Item < ApplicationRecord
  validates :title,            presence: true
  validates :price,            presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :concept,          presence: true
  validates :image,            presence: true
  validates :category_id,      presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :condition_id,     presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :postage_payer_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :ship_area_id,     presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :ship_date_id,     presence: true, numericality: { other_than: 1 , message: "can't be blank" }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postagepayer
  belongs_to :shiparea
  belongs_to :shipdate
end
