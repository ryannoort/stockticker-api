class CommodityTransaction < ApplicationRecord
  TYPE_SALE = "sale".freeze
  TYPE_PURCHASE = "purchase".freeze
  TYPES = [TYPE_SALE, TYPE_PURCHASE].freeze

  belongs_to :commodity, required: true
  belongs_to :user, required: true

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :transaction_type, presence: true, inclusion: { in: TYPES }

  TYPES.each do |type|
    define_method("#{type}?") do
      transaction_type == type
    end
  end
end
