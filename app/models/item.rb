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
  validates :ship_day_id,      numericality: { other_than: 1, message: "can't be blank" }

  belongs_to       :user
  has_one_attached :image
  has_one          :order, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :payer, foreign_key: 'postage_payer_id'
  belongs_to :area,  foreign_key: 'ship_area_id'
  belongs_to :day,   foreign_key: 'ship_day_id'
end
