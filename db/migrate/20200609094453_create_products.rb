class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :code
      t.string :name
      t.integer :stock_number
      t.text :image_url
      t.text :note

      t.timestamps
    end
  end
end
