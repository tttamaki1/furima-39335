class CreateShippingEstimates < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_estimates do |t|
      t.string     :title        , null: false
      t.text       :text         , null: false
      t.integer    :shipping_estimate_id     , null: false
      t.timestamps
    end
  end
end
