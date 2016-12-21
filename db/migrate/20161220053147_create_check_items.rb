class CreateCheckItems < ActiveRecord::Migration[5.0]
  def change
    create_table :check_items do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :price_min, default: 0
      t.integer :price_max, default: 0

      t.timestamps
    end
  end
end
