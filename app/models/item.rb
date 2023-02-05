class Item < ApplicationRecord
  validates :title,            presence: true
  validates :price,            presence: true,
                               numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  validates :price,                            numericality: { only_integer: true, message: 'Half-width number.' }
  validates :concept,          presence: true
  validates :image,            presence: true
  validates :category_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,     numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_payer_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_area_id,     numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_date_id,     numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postagepayer, optional: true
  belongs_to :shiparea,     optional: true
  belongs_to :shipdate,     optional: true
end
