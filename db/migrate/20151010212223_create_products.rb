class CreateProducts < ActiveRecord::Migration
  def change
    create_table(:products) do |t|
      t.references :category
      t.string :title
      t.string :image
      t.string :description
      t.string :price
      t.string :link
      t.string :slug

      t.timestamps
    end

    add_index :products, :category_id
    add_index :products, :slug, unique: true
  end
end
