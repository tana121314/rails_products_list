class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :code
      t.string :name
      t.text :image_url
      t.text :note

      t.timestamps
    end
  end
end
