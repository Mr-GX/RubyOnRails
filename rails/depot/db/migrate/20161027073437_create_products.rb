class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :desc
      t.string :image_url
      t.decimal :price,:precision=>8,:scale=>2

      t.timestamps
    end
  end
end
