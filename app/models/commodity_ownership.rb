class CommodityOwnership < ApplicationRecord
  belongs_to :commodity
  belongs_to :user

  validates :commodity_id, uniqueness: { scope: :user_id }
  validates :quantity, presence: true, numericality: { greater_than_eq: 0 }

  scope :with_total_value, -> do
    select("commodity_ownerships.*, (commodity_ownerships.quantity * commodities.price) as total_value").
      joins(:commodity)
  end
end
