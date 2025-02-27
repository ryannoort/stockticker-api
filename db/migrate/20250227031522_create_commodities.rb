class CreateCommodities < ActiveRecord::Migration[8.0]
  def change
    create_table :commodities do |t|
      t.string :name, collation: 'NOCASE', index: { unique: true }
      t.integer :price, null: false

      t.timestamps
    end
  end
end
