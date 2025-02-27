class CommodityAdjustment < ApplicationRecord
  belongs_to :commodity

  validates :price_change, presence: true
  validates :adjusted_price, presence: true
end
